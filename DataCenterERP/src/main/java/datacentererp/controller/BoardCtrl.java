package datacentererp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import datacentererp.model.Board;
import datacentererp.model.BoardSch;
import datacentererp.service.BoardService;

@Controller
public class BoardCtrl {
	@Autowired(required = false)
	private BoardService service;
	
	
	@RequestMapping("QnA.do")
	public String boardList(@ModelAttribute("sch") BoardSch sch, Model d) {
		//boardSch의 모델명을 변경할때 사용옵션 : ModelAttribute 사용
		d.addAttribute("blist", service.getBoardList(sch));
		return "a01_boardList";
	}
	
	@RequestMapping("boardInsertFrm.do")
	public String boardInsertFrm() {
		return "a02_boardInsert";
	}
	 @PostMapping("boardInsert.do")
	   public String boardInsert(Board ins, Model d) {
	      d.addAttribute("msg", service.boardInsert(ins));
	      return "a02_boardInsert";
	   }	
	
	@GetMapping("boardDetail.do")
	public String boardDetail(@RequestParam("no") int no, Model d) {
		d.addAttribute("board", service.detail(no));
		return "a03_boardDetail";
	}

	@PostMapping("boardUpdate.do")
	public String boardUpdate(Board upt, Model d) {
		d.addAttribute("msg", service.updateBoard(upt));
		d.addAttribute("board", service.detail(upt.getNo()));
		return "a03_boardDetail";
	}
	// boardUpdate.do boardDelete.do
	@GetMapping("boardDelete.do")
	public String boardDelete(@RequestParam("no") int no, Model d) {
		d.addAttribute("msg", service.deleteBoard(no));
		d.addAttribute("proc", "del");
		return "a03_boardDetail";
	}	
	
	
	
	
	
}
