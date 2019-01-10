

--
-- Tabellstruktur `chars`
--

CREATE TABLE IF NOT EXISTS `chars` (
`ID` int(11) NOT NULL,
  `STEAMID` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `Firstname` varchar(255) NOT NULL,
  `Lastname` varchar(255) NOT NULL,
  `DOB` varchar(255) NOT NULL,
  `Gender` varchar(255) NOT NULL,
  `d_license` tinyint(1) NOT NULL,
  `cd_license` tinyint(1) NOT NULL,
  `license_p` int(11) NOT NULL,
  `b_license` tinyint(1) NOT NULL,
  `f_license` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `srr_char_bolos`
--

CREATE TABLE IF NOT EXISTS `srr_char_bolos` (
`ID` int(11) NOT NULL,
  `STEAMID` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `bolo` varchar(255) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `srr_char_charges`
--

CREATE TABLE IF NOT EXISTS `srr_char_charges` (
`ID` int(11) NOT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `STEAMID` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `officer_STEAMID` varchar(255) NOT NULL,
  `officer_Username` varchar(255) NOT NULL,
  `charge` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `srr_char_plate`
--

CREATE TABLE IF NOT EXISTS `srr_char_plate` (
`ID` int(11) NOT NULL,
  `ts` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `STEAMID` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `plate_number` varchar(255) NOT NULL,
  `veh_name` varchar(255) NOT NULL,
  `flag_stolen` tinyint(1) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tabellstruktur `srr_char_warrants`
--

CREATE TABLE IF NOT EXISTS `srr_char_warrants` (
`ID` int(11) NOT NULL,
  `ts` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `STEAMID` varchar(255) NOT NULL,
  `Username` varchar(255) NOT NULL,
  `officer_STEAMID` varchar(255) NOT NULL,
  `officer_Username` varchar(255) NOT NULL,
  `warrant` varchar(255) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- AUTO_INCREMENT för tabell `chars`
--
ALTER TABLE `chars`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=70;
--
-- AUTO_INCREMENT för tabell `srradmin`
--

ALTER TABLE `srr_char_bolos`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT för tabell `srr_char_charges`
--
ALTER TABLE `srr_char_charges`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT för tabell `srr_char_inv`
--
ALTER TABLE `srr_char_plate`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=83;
--
-- AUTO_INCREMENT för tabell `srr_char_warrants`
--
ALTER TABLE `srr_char_warrants`
MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
