create table guru (
    'nip' varchar(100) NOT NULL,
    'id_mata_pelajaran' int(11) NOT NULL,
    'nama' varchar(255) NOT NULL,
    
    ADD PRIMARY KEY('nip')
)
create table mata_pelajaran (
    'nama' varchar(255) NOT NULL,
    'durasi' varchar(10) NOT NULL,
    'id_guru' varchar(100) NOT NULL,
    'id_siswa' int(11) NOT NULL,
    'id' int(11) NOT NULL,

    ADD PRIMARY KEY('id')
)
create table siswa (
    'id' int(11) NOT NULL AUTO_INCREMENT,
    'nama' varchar(255) NOT NULL,
    'no absen' varchar(10) NOT NULL,
    'kelas' varchar(10) NOT NULL,
    'mata_pelajaran_id' int(11) NOT NULL,

    ADD PRIMARY KEY('id')
)
create table piket (
    'id' int(11) NOT NULL,
    'hari' varchar(10) NOT NULL,
    'id_siswa' int(11) NOT NULL,
)

create ALTER TABLE mata_pelajaran (
    ADD KEY `id_guru` (`id_guru`);
    ADD KEY `id_siswa` (`id_siswa`);
    ADD CONSTRAINT `mata_pelajaran_ibfk_1` FOREIGN KEY (`id_guru`) 
    REFERENCES `guru` (`nip`),
    ADD CONSTRAINT `mata_pelajaran_ibfk_2` FOREIGN KEY (`id_siswa`) 
    REFERENCES `siswa` (`id`);
)
create ALTER TABLE guru (
    ADD KEY `id_mata_pelajaran` (`id_mata_pelajaran`);
    ADD CONSTRAINT `guru_ibfk_1` FOREIGN KEY (`id_mata_pelajaran`) 
    REFERENCES `mata_pelajaran` (`id`);
)
create ALTER TABLE siswa (
    ADD KEY `mata_pelajaran_id` (`mata_pelajaran_id`);
    ADD CONSTRAINT `siswa_ibfk_1` FOREIGN KEY (`mata_pelajaran_id`) 
    REFERENCES `mata_pelajaran` (`id`);
)
create ALTER TABLE piket (
     ADD KEY `id_siswa` (`id_siswa`);
     ADD CONSTRAINT `piket_ibfk_1` FOREIGN KEY (`id_siswa`) 
     REFERENCES `siswa` (`id`);
)