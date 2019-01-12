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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumpning av Data i tabell `chars`
--

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Index för dumpade tabeller
--

--
-- Index för tabell `chars`
--
ALTER TABLE `chars`
 ADD PRIMARY KEY (`ID`);

--
-- Index för tabell `srr_char_bolos`
--
ALTER TABLE `srr_char_bolos`
 ADD PRIMARY KEY (`ID`);

--
-- Index för tabell `srr_char_charges`
--
ALTER TABLE `srr_char_charges`
 ADD PRIMARY KEY (`ID`);

--
-- Index för tabell `srr_char_plate`
--
ALTER TABLE `srr_char_plate`
 ADD PRIMARY KEY (`ID`);

--
-- Index för tabell `srr_char_warrants`
--
ALTER TABLE `srr_char_warrants`
 ADD PRIMARY KEY (`ID`);
