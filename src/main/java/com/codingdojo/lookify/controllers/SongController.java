package com.codingdojo.lookify.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.codingdojo.lookify.Services.SongService;
import com.codingdojo.lookify.models.Song;

@Controller
public class SongController {
	private final SongService songService;
	
	public SongController(SongService songService) {
		this.songService = songService;
	}
	
	
	
///////////////////////
	
	@RequestMapping("/")
	public String main() {
		return "main.jsp";
	}

	@RequestMapping("/dashboard")
	public String dashboard(Model model) {
		List<Song> songs = songService.allSongs();
		model.addAttribute("Songs", songs);
		return "dashboard.jsp";
	}
	
	
	@RequestMapping("/search/topten")
	public String topten(Model model) {
		List<Song> songs = songService.getTopTen();
		System.out.println(songs);
		model.addAttribute("Songs", songs);
		return "topten.jsp";	
	}
	
	@RequestMapping("search/{artist}")
	public String search(@PathVariable("artist") String artist, Model model) {
		List<Song> songs = songService.searchArtist(artist);
		model.addAttribute("Songs", songs);
		model.addAttribute("artist", artist);
		return "artist.jsp";
	}
	
	@RequestMapping("/songs/{id}")
	public String song(@PathVariable("id") Long id, Model model) {
		Song song = songService.findSong(id);
		model.addAttribute("song", song);
		return "song.jsp";
	}
	
	@RequestMapping("/songs/new")
	public String upload( Model model) {
		model.addAttribute("upload", new Song());
		return "upload.jsp";
	}
	
///////////////////////////////////////////////////////////
	@RequestMapping(value="/processForm", method=RequestMethod.POST)
	public String upload(@Valid @ModelAttribute("upload") Song song, BindingResult result) {
		System.out.println(song);
		if (result.hasErrors()) {
			return "upload.jsp";			
		} else {
			songService.uploadSong(song);
			return "redirect:/dashboard";
		}
	}
		
	
	@RequestMapping(value="/songs/delete/{id}", method=RequestMethod.DELETE)
	public String delete(@PathVariable("id") Long id) {
		songService.deleteSong(id);
		return "redirect:/dashboard";
	}


	@RequestMapping(value="search", method = RequestMethod.POST)
	public String search(@RequestParam("search") String artist) {
		return "redirect:/search/"+artist;
	}
	
	
	
	
	
	
	
	
	
	
}
