CREATE TABLE IF NOT EXISTS `characters_skills` (
  `cid` varchar(50) NOT NULL,
  `skills` longtext NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;