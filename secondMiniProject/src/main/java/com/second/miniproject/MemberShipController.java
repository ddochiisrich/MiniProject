package com.second.miniproject;


import java.io.File;
import java.io.IOException;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.second.miniproject.domain.CarInfo;
import com.second.miniproject.domain.MemberShip;
import com.second.miniproject.service.CarInfoService;
import com.second.miniproject.service.MemberService;

@Controller
@SessionAttributes("membership") // 해당 컨트롤러 내에서만 동작. 해당 컨트롤러 안에서 다루는 특정 모델 객체를 세션에 넣고 공유할 때 사용
public class MemberShipController {
	
	private static final String DEFAULT_PATH = "/resources/Profile/";

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CarInfoService carInfoService ;

	@RequestMapping("/memberUpdateForm")
	public String memberUpdateForm() {

		return "member/memberUpdateForm";

	}

	// 회원 수정 폼
	@RequestMapping("/memberUpdateResult")
	public String memberUpdateResult(Model model, MemberShip member, String pass1, String emailId, String emailDomain,
			String mobile1, String mobile2, String mobile3,
			@RequestParam(value = "emailGet", defaultValue = "false") boolean emailGet) {

		member.setPass(pass1);
		member.setEmail(emailId + "@" + emailDomain);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);

		member.setEmailGet(emailGet);

		// MemberService를 통해서 회원 정보를 DB에 수정
		memberService.addMember(member);

		// 세션에 수정된 회원 정보를 갱신
		model.addAttribute("membership", member);

		// 회원가입이 완료되면 loginForm으로 redirect 시킨다.
		return "redirect:main";
	}

	// 회원가입 폼
	@RequestMapping("/joinResult")
	public String joinResult(MemberShip member, String pass1, String emailId, String emailDomain, String mobile1,
			String mobile2, String mobile3,
			@RequestParam(value = "emailGet", defaultValue = "false") boolean emailGet,
			HttpServletRequest req,
			@RequestParam(value="profile")MultipartFile multipartFile) throws IOException {
		
		if(! multipartFile.isEmpty()) {
			String realPath = req.getServletContext().getRealPath(DEFAULT_PATH);
			
			UUID uid = UUID.randomUUID();
			String saveName = uid.toString() + "_" + multipartFile.getOriginalFilename();
			File file = new File(realPath, saveName);
			System.out.println("joinResult : "+file.getName());
			
			multipartFile.transferTo(file);
		}

		member.setPass(pass1);
		member.setEmail(emailId + "@" + emailDomain);
		member.setMobile(mobile1 + "-" + mobile2 + "-" + mobile3);

		member.setEmailGet(emailGet);

		// MemberService를 통해서 회원 정보를 DB에 수정
		memberService.addMember(member);

		// 회원가입이 완료되면 loginForm으로 redirect 시킨다.
		return "redirect:loginForm";
	}

	// 회원 가입 폼에서 들어오는 중복 아이디 체크 요청을 처리하는 메서드
	@RequestMapping("/overlapIdCheck")
	public String overlapIdCheck(Model model, String id) {

		boolean overlap = memberService.overlapIdCheck(id);
		model.addAttribute("overlap", overlap);
		model.addAttribute("id", id);

		// viewResolver 의 prefix + 반환하는 view의 이름 + suffix
		// /WEB-INF/index.jsp?body=views/ + member/overlapIdCheck + .jsp
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}

	// login 요청을 처리하는 메서드
	@PostMapping("/login")
	public String login(Model model, @RequestParam("userId") String id, String pass, HttpSession session,
			HttpServletResponse response) throws IOException {
		
		session.setAttribute("id", id);
		
		
		int result = memberService.login(id, pass);
		if (result == -1) { // id가 존재하지 않는 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // 응답할때
			out.println("<script>");
			out.println(" alert('존재하지 않는 아이디 입니다.')");
			out.println("history.back();");
			out.println("</script>");

			return null;

		} else if (result == 0) { // 비밀번호가 틀린 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter(); // 응답할때
			out.println("<script>");
			out.println(" alert('비밀번호가 틀립니다. 다시 입력 해주세요.')");
			out.println("history.back();");
			out.println("</script>");

			return null;
		}
		
		

		
		MemberShip member = memberService.getMember(id);
		
		session.setAttribute("isLogin", true);
		
		
		boolean check = carInfoService.carInfoCheck(id);
		

		// 맴버가 자동차 등록을했는지 확인
		session.setAttribute("carInfoCheck", check);
		
		// 자동차가 있으면 자동차 정보를 담는다 .
		if (check) {
	        CarInfo info = carInfoService.carInfo(id);
	        session.setAttribute("info", info);
	        
	     // cmanufacturer 값을 세션에 저장
	        if (info != null) {
	            String cmanufacturer = info.getCmanufacturer();
	            session.setAttribute("cmanufacturer", cmanufacturer);
	        }
	        

	        // Calculate the number of days since createdAt
	        if (info != null && info.getCreatedAt() != null) {
	            LocalDate createdAt = info.getCreatedAt().toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
	            LocalDate now = LocalDate.now();
	            long diffInDays = ChronoUnit.DAYS.between(createdAt, now);
	            session.setAttribute("diffInDays", diffInDays);
	        } else {
	            session.setAttribute("diffInDays", 0);
	        }
	    } else {
	        session.setAttribute("diffInDays", 0);
	    }

		
		
		// session.setAttribute("member", member);
		model.addAttribute("membership", member);

		return "redirect:main";
	}

	// logout 요청을 처리하는 메서드
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate(); // 이전 세션을 없애고 새로운 새션을 열떄

		return "redirect:main";
	}

}
;