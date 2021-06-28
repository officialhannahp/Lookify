package com.codingdojo.lookify.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.lookify.models.Song;

@Repository
public interface SongRepository extends CrudRepository<Song, Long>{
	List<Song> findAll();
	List<Song> findByArtist(String search);
	@Query(value = "SELECT * FROM songs ORDER BY rating DESC LIMIT 10", nativeQuery = true)
	List<Song> findTopTenByOrderByRatingDesc();
}
