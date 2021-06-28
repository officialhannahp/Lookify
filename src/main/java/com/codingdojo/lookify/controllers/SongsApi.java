package com.codingdojo.lookify.controllers;

import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.codingdojo.lookify.Services.SongService;
import com.codingdojo.lookify.models.Song;


@RestController
public class SongsApi {
	private final SongService songService;
	
	public SongsApi(SongService songService) {
		this.songService = songService;
	}
	
	@RequestMapping("/api/songs")
	public List<Song> main() {
		return songService.allSongs();
	}
	
	@RequestMapping(value="api/songs", method=RequestMethod.POST)
	public Song upload(@RequestParam(value="title") String title,
			@RequestParam(value="artist") String artist,
			@RequestParam(value="rating") Integer rating) {
		Song song = new Song(title, artist, rating);
		return songService.uploadSong(song);
	}
}	
//	@RequestMapping("api/langauges/{id}")
//	public Song show(@PathVariable("id") Long id)
//}
