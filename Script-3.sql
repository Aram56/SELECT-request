CREATE TABLE IF NOT EXISTS Genre (
    id SERIAL PRIMARY KEY,
    name_genre VARCHAR(40) NOT NULL);
    
CREATE TABLE IF NOT EXISTS Performer (
    id SERIAL PRIMARY KEY,
    name_performer VARCHAR(80) NOT NULL);
    
CREATE TABLE IF NOT EXISTS GenrePerformer (
    genre_id INTEGER REFERENCES Genre(id),
    performer_id INTEGER REFERENCES Performer(id),
    CONSTRAINT gp PRIMARY KEY (genre_id, performer_id));
    
CREATE TABLE IF NOT EXISTS Album (
    id SERIAL PRIMARY KEY, 
    name_album VARCHAR(80) NOT NULL,
    release_year_album INTEGER NOT NULL);
    
CREATE TABLE IF NOT EXISTS AlbumPerformer (
    album_id INTEGER REFERENCES Album(id),
    performer_id INTEGER REFERENCES Performer(id),
    CONSTRAINT ap PRIMARY KEY (album_id, performer_id));
    
CREATE TABLE IF NOT EXISTS Track (
    id INTEGER PRIMARY KEY, 
    name_track VARCHAR(80) NOT NULL,
    duration_track INTEGER NOT NULL,
    album_id INTEGER NOT NULL REFERENCES Album(id));
   
CREATE TABLE IF NOT EXISTS Compilation (
    id SERIAL PRIMARY KEY, 
    name_compilation VARCHAR(80) NOT NULL,
    release_year_compilation INTEGER NOT NULL);
    
CREATE TABLE IF NOT EXISTS TrackCompilation (
    track_id INTEGER REFERENCES track(id),
    compilation_id INTEGER REFERENCES Compilation(id),
    CONSTRAINT tc PRIMARY KEY (track_id, compilation_id));