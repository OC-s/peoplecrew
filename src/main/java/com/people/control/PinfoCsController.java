package com.people.control;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.people.dto.BoardDTO;
import com.people.dto.PinfoAnswerDTO;
import com.people.dto.PinfoCsDTO;
import com.people.dto.PinfoFileDTO;
import com.people.dto.PinfoMemOriDTO;
import com.people.dto.PinfoMemberDTO;
import com.people.service.PinfoAnswerService;
import com.people.service.PinfoCsService;
import com.people.service.PinfoMemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/personnel_info")
public class PinfoCsController {
	@Autowired
	PinfoCsService service;

	@Autowired
	PinfoMemberService mServ;
	
	@Autowired
	PinfoAnswerService answer;
	
	@GetMapping("/cs")
	public String list(Model model, @RequestParam(name = "cp", defaultValue = "1") int currentPage) {

		int totalNumber = service.getBoardCount(); 
		int recordPerPage = 10; 
		

		Map<String, Object> map = com.people.util.PageUtil.getPageData(totalNumber, recordPerPage, currentPage); 
		int startNo = (int) map.get("startNo"); 
		int endNo = (int) map.get("endNo"); 
		List<PinfoCsDTO> list = service.selectAll(startNo, endNo);
		model.addAttribute("map", map); 
		model.addAttribute("list", list);
		return "/personnel_info/cs"; 
	}

	@RequestMapping("/detail")
	public String detail(@RequestParam("bono") int bono, Model model) {
		log.info("==============> 게시글 상세조회");

		service.raisehits(bono);
		PinfoCsDTO dto = service.getOne(bono);
		PinfoAnswerDTO ansdto = answer.getOneBono(bono);
		int fno = dto.getFno();

		model.addAttribute("boarddto", dto);
		model.addAttribute("ans",ansdto);
		int total = service.getTotal(bono);
		model.addAttribute("total", total); 
		model.addAttribute("files", service.fileDetailService(fno)); 
		return "/personnel_info/detail";
	}

	@GetMapping("/write") 
	public String write() {
		log.info("===========================> 글쓰기페이지");
		
		return "/personnel_info/write";
	}

	@PostMapping("/write") // 글 등록
	public String writeOk(HttpServletRequest request, @RequestParam("file") MultipartFile files) throws Exception, IOException {
		log.info("===========================> 글 등록하기");
		PinfoCsDTO dto = new PinfoCsDTO();
		PinfoFileDTO file = new PinfoFileDTO();

		dto.setBotitle(request.getParameter("botitle"));
		dto.setBocontents(request.getParameter("bocontents"));
		String no = request.getParameter("mno");
		int mno = Integer.parseInt(no);
		dto.setMno(mno);
		
		if (files.isEmpty()) { // 업로드할 파일이 없을 시
			System.out.println("파일없음");
			service.write(dto); // 게시글 insert
		} else {
			String fileName = files.getOriginalFilename();
			System.out.println("파일이름 : " + fileName);
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "C:\\temp\\"; // 파일 저장 경로
			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			file.setFname(destinationFileName);
			file.setOriname(fileName);
			file.setFpath(fileUrl);
			file.setMno(mno);

			service.fileInsertService(file); // file insert
			dto.setFno(file.getFno());

			service.write(dto); // 파일먼저 등록 후 파일번호 받아옴.
			log.info("===========================> 글과 파일 업로드");
		}
		return "redirect:/personnel_info/cs";
	}

	@GetMapping("/modify") // 수정
	public String modify(@RequestParam("bono") int bono, Model model) {
		log.info("===========================> 게시글 수정하기 ");
		PinfoCsDTO dto = service.getOne(bono);
		model.addAttribute("files", service.fileDetailService(dto.getFno())); // 첨부파일
		model.addAttribute("dto", dto);
		return "/personnel_info/modify";
	}

	@PostMapping("/modify") // 수정완료
	public String modifyOk(HttpServletRequest request, @ModelAttribute("dto") PinfoCsDTO dto, @RequestParam("file") MultipartFile files) throws Exception, IOException {

		String no = request.getParameter("fno"); // 기존파일 삭제 처리 했을 경우 파일삭제
		if (no != null) {
			int fno = Integer.parseInt(no);
			System.out.println(fno);
			service.removeFileByFno(fno);
		}

		PinfoFileDTO file = new PinfoFileDTO();

		if (files.isEmpty()) { // 새로 업로드할 파일이 없을 시
			service.modifyNoFile(dto); // 파일번호 안넘기고 수정
		} else { // 새로 올릴 파일 있으면

			String fileName = files.getOriginalFilename();
			String fileNameExtension = FilenameUtils.getExtension(fileName).toLowerCase();
			File destinationFile;
			String destinationFileName;
			String fileUrl = "C:\\temp\\";

			do {
				destinationFileName = RandomStringUtils.randomAlphanumeric(32) + "." + fileNameExtension;
				destinationFile = new File(fileUrl + destinationFileName);
			} while (destinationFile.exists());

			destinationFile.getParentFile().mkdirs();
			files.transferTo(destinationFile);

			file.setFname(destinationFileName);
			file.setOriname(fileName);
			file.setFpath(fileUrl);
			file.setMno(dto.getMno());
			service.fileInsertService(file); // file insert

			dto.setFno(file.getFno());
			service.modify(dto); // 파일 번호 받아서 수정
			log.info("===========================> 글과 파일 업로드 완료");
		}
		return "redirect:/personnel_info/detail?bono=" + dto.getBono(); // 이전페이지로
	}
	
	
	@GetMapping("/delete")
	public String deleteOk(@RequestParam("bono")int bono) {
		int fno = service.getOne(bono).getFno();
		service.removeFileByFno(fno); // 파일 삭제
		service.removeRAll(bono); // 댓글 삭제
		answer.removeOne(bono);
		service.remove(bono); // 글삭제
		
		return "redirect:/personnel_info/cs";
	}

	@RequestMapping("/filedown/{fno}") // 파일 다운로드
	@ResponseBody
	private void fileDown(@PathVariable int fno, HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("UTF-8");
		PinfoFileDTO dto = service.fileDetailService(fno);

		// 파일 업로드된 경로
		try {
			String fileUrl = dto.getFpath();
			fileUrl += "/";
			String savePath = fileUrl;
			String fileName = dto.getFname();

			// 실제 내보낼 파일명
			String oriFileName = dto.getOriname();
			InputStream in = null;
			OutputStream os = null;
			File file = null;
			boolean skip = false;
			String client = "";

			// 파일을 읽어 스트림에 담기
			try {
				file = new File(savePath, fileName);
				// System.out.println("파일 : "+file);
				in = new FileInputStream(file);
			} catch (FileNotFoundException fe) {
				skip = true;
			}

			client = request.getHeader("User-Agent");

			response.reset();// 파일 다운로드 헤더 지정
			response.setContentType("application/octet-stream"); // 파일 종류
			response.setHeader("Content-Description", "JSP Generated Data");// 파일의 이름

			if (!skip) {
				// IE
				if (client.indexOf("MSIE") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\"" + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
					// IE 11 이상.
				} else if (client.indexOf("Trident") != -1) {
					response.setHeader("Content-Disposition", "attachment; filename=\"" + java.net.URLEncoder.encode(oriFileName, "UTF-8").replaceAll("\\+", "\\ ") + "\"");
				} else {
					// 한글 파일명 처리
					response.setHeader("Content-Disposition", "attachment; filename=\"" + new String(oriFileName.getBytes("UTF-8"), "ISO8859_1") + "\"");
					response.setHeader("Content-Type", "application/octet-stream; charset=utf-8");
				}
				response.setHeader("Content-Length", "" + file.length());
				os = response.getOutputStream();
				byte b[] = new byte[(int) file.length()];
				int leng = 0;
				while ((leng = in.read(b)) > 0) {
					os.write(b, 0, leng);
				}
			} else { // 파일 읽기 실패
				response.setContentType("text/html;charset=UTF-8");
				System.out.println("파일 읽기 실패");
			}
			in.close();
			os.close();
		} catch (Exception e) {
			System.out.println("ERROR : " + e.getMessage());
		}

	}
	
	@GetMapping("/answer") 
	public String answer(@RequestParam("bono") int bono, Model model) {
		log.info("===========================> 답변 작성 페이지");
		PinfoCsDTO dto = service.getOne(bono);
		
		model.addAttribute("boarddto", dto);
			
		return "/personnel_info/answer";
	}

	@PostMapping("/answer") //답변  등록
	public String answerOk(@RequestParam("bono") int bono,HttpServletRequest request) {
		log.info("===========================> 답변 등록하기");
		
		PinfoCsDTO dto = service.getOne(bono);
		PinfoAnswerDTO ansdto = new PinfoAnswerDTO();
		
		ansdto.setAnstitle(request.getParameter("anstitle"));
		ansdto.setAnscontents(request.getParameter("anscontents"));
		int mno = dto.getMno();
		ansdto.setMno(mno);
		ansdto.setBono(bono);
		
		answer.insertOne(ansdto);
		service.upStatus(bono);
		
		return "redirect:/personnel_info/detail?bono="+bono;
	}
	
	@GetMapping("/ansmodi")
	public String ansmodi(@RequestParam("bono") int bono, Model model) {
		
		log.info("==============> 답변 수정");
		PinfoCsDTO dto = service.getOne(bono);
		model.addAttribute("boarddto", dto);
		
		PinfoAnswerDTO ansdto = answer.getOneBono(bono);
		
		model.addAttribute("ans", ansdto);
		return "/personnel_info/ansmodi";
	}

	@PostMapping("/ansmodi")
	public String ansmodiOk( @ModelAttribute("ans") PinfoAnswerDTO ans,RedirectAttributes re, Model model) {
	
		int bono = ans.getBono();
		PinfoCsDTO dto = service.getOne(bono);
		model.addAttribute("boarddto", dto);
		
		
		
		answer.updateOne(ans);
		re.addAttribute("bono",ans.getBono());
		
		log.info("수정 : {}",ans);
		
		return "redirect:/personnel_info/detail";
	

	}
	
	
	@GetMapping("/ansdelete")
	public String deleteAnsOk(@RequestParam("bono")int bono) {
		service.upRemove(bono);
		
		answer.removeOne(bono); // 삭제
		return "redirect:/personnel_info/cs";
	}
	
}