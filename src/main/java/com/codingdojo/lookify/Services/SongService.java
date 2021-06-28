package com.codingdojo.lookify.Services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.codingdojo.lookify.models.Song;
import com.codingdojo.lookify.repositories.SongRepository;

@Service
public class SongService {
	private final SongRepository songRepo;
	
	public SongService(SongRepository songRepo) {
		this.songRepo = songRepo;
	}
	
	//returns all the songs
	public List<Song> allSongs(){
		return songRepo.findAll();
	}
	
	//create/upload a song
	public Song uploadSong(Song s) {
		return songRepo.save(s);
	}
	
	//retrieves a song
	public Song findSong(Long id) {
		Optional<Song> song = songRepo.findById(id);
		if(song.isPresent()) {
            return song.get();
        }
        else {
            return null;
        }
	}
	
	//retrieve top ten songs
	public List<Song> getTopTen(){
		System.out.println("test");
		return songRepo.findTopTenByOrderByRatingDesc();
	}
	
	//search a song
	public List<Song> searchArtist(String artist){
		return songRepo.findByArtist(artist);
	}
	
	//delete a song
	public void deleteSong(Long id) {
		songRepo.deleteById(id);
	}
	
}
