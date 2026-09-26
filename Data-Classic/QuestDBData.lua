GQ.Quest_Cache_Accept_Alliance = {
	["DUNGEONS\\Blackfathom Deeps Quests"] = {
		{ids="3765,971,1275,1199,1198,1200"},
	},
	["DUNGEONS\\Blackrock Depths Quests"] = {
		{ids="4324,3702,3701,4128,4126,4286,4182,4262,4183,4341,4184,4185,4186,4223,4224,4241,3441,3442,3443,3452,3453,3454,3462,3463,3481,4123,4136,4022,4024,3801,3802,4264,4342,4361,4242,4282,4201,4322,4263,4362,4363"},
	},
	["DUNGEONS\\Dire Maul East Quests"] = {
		{ids="5527,5526,7488,7441"},
	},
	["DUNGEONS\\Dire Maul North Quests"] = {
		{ids="7482,5518,5528,7703"},
	},
	["DUNGEONS\\Dire Maul West Quests"] = {
		{ids="7461,7462"},
	},
	["DUNGEONS\\Gnomeregan Quests"] = {
		{ids="2923,2928,2925,2924,2922,2927,2930,2929,2926,2962"},
	},
	["DUNGEONS\\Lower Blackrock Spire Quests"] = {
		{ids="3520,3527,4787,3528,5065,4788,4701,4866,4729,4862,4867,5001,5002,5081,4742"},
	},
	["DUNGEONS\\Maraudon Quests"] = {
		{ids="7070,7041,7065,7028,7067,7044,7046,7066"},
	},
	["DUNGEONS\\Raid Attunements\\Blackwing Lair Attunement"] = {
		{ids="7761"},
	},
	["DUNGEONS\\Raid Attunements\\Molten Core Attunement"] = {
		{ids="7848"},
	},
	["DUNGEONS\\Raid Attunements\\Naxxramas Attunement"] = {
		{ids="9123", cond_if=[[rep("Argent Dawn") == Exalted or completedq(9123)]]},
		{ids="9122", cond_if=[[rep("Argent Dawn") == Revered or completedq(9122)]]},
		{ids="9121", cond_if=[[rep("Argent Dawn") < Revered or completedq(9121)]]},
	},
	["DUNGEONS\\Raid Attunements\\Onyxia's Lair Attunement"] = {
		{ids="4182,4183,4184,4185,4186,4223,4224,4241,4242,4264,4282,4322,6402,6403,6501,6502"},
	},
	["DUNGEONS\\Razorfen Downs Quests"] = {
		{ids="3636,6626,3523,3525"},
	},
	["DUNGEONS\\Razorfen Kraul Quests"] = {
		{ids="1221,1100,1101,1142,1144"},
	},
	["DUNGEONS\\Scarlet Monastery Armory Quests"] = {
		{ids="6141,261,1052,1053"},
	},
	["DUNGEONS\\Scarlet Monastery Cathedral Quests"] = {
		{ids="6141,261,1052,1053"},
	},
	["DUNGEONS\\Scarlet Monastery Library Quests"] = {
		{ids="6141,261,1052,1053,1050"},
	},
	["DUNGEONS\\Scholomance Quests"] = {
		{ids="5091,4726,4808,4809,4810,4907,4734,4735,5522,5531,5529,4771,5092,5097,5533,5537,5538,5801,5803,5505,5343,5382,5515,5582,5384,5461,5462,5463,5464,5465,5466"},
	},
	["DUNGEONS\\Stratholme - Live Side Quests"] = {
		{ids="5214,5251,5281,5282,5542,5543,5544,5742,5781,5845,5846,5848,5122,5262"},
	},
	["DUNGEONS\\Stratholme - Undead Side Quests"] = {
		{ids="5382,5515,5384,5461,5462,5463,5251,5262,5263,5212,5243,5122,5125,5464,5213"},
	},
	["DUNGEONS\\Temple of Atal'Hakkar Quests"] = {
		{ids="1448,1449,1450,1451,1452,3445,1469,1475,3444,3446,3520,3527,4787,1446,3528,4141,4142,4143,3447,3373"},
	},
	["DUNGEONS\\The Deadmines Quests"] = {
		{ids="167,168,2040,65,132,135,141,142,155,166,214,373"},
	},
	["DUNGEONS\\The Stockade Quests"] = {
		{ids="303,378,386,377,388,373,389,391,387"},
	},
	["DUNGEONS\\Tier 0.5 Dungeon Gear Questline"] = {
		{ids="8907,8932,8953,9001", cond_if=[[Mage]]},
		{ids="8912,8937,8959,9006", cond_if=[[Warrior]]},
		{ids="8906,8931,8952,9000", cond_if=[[Hunter]]},
		{ids="8908,8933,8954,9002", cond_if=[[Paladin]]},
		{ids="8910,8935,8956,9004", cond_if=[[Rogue]]},
		{ids="8905,8926,8951,8999", cond_if=[[Druid]]},
		{ids="8911,8936,8958,9005", cond_if=[[Warlock]]},
		{ids="8909,8934,8955,9003", cond_if=[[Priest]]},
		{ids="8922,8921,8924,8925,8928,8977,8929,8945,8946,8947,8948,8949,8950,9015,8960,8961,8964,8965,8962,8963,8968,8969,8966,8967,8970,8985,8986,8988,8987,8991,8992,8989,8990,8994,8995,8996,8997"},
	},
	["DUNGEONS\\Uldaman Quests"] = {
		{ids="2278,2279,2439", cond_if=[[level >=40]]},
		{ids="2198,2199,2200,2398,720,721,722,723,724,707,725,726,762,2500,738,739,704,17,1139,2201,2240,2204"},
	},
	["DUNGEONS\\Upper Blackrock Spire Quests"] = {
		{ids="4766,4764,4726,4182,4183,4184,4185,4186,4223,4224,4241,4242,4264,4282,4322,6402,6403,6501,4808,4809,4810,6502,4907,4734,6804,6805,6821,5089,5102,5160,5047,4735,5164"},
	},
	["DUNGEONS\\Wailing Caverns Quests"] = {
		{ids="865,1491,959,1486,1487,3366,6981,3370"},
	},
	["DUNGEONS\\Zul'Farrak Quests"] = {
		{ids="2988,2989,2990,2991,2846,2770,3520,3527,2768,2865,3042"},
	},
	["EVENTS\\Children's Week\\Children's Week Main Questline"] = {
		{ids="1468,1479,1558,1687,4822,558,171"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Chronos Turn-Ins (Elwynn Forest)"] = {
		{ids="7881,7882,7883,7884,7885,7941"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Kerri Hicks Turn-Ins (Elwynn Forest)"] = {
		{ids="7889,7890,7891,7892,7893,7939"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Rinling Turn-Ins (Elwynn Forest)"] = {
		{ids="7894,7895,7896,7897,7898,7942"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Sayge's Fortunes (Elwynn Forest)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Spawn of Jubjub (Elwynn Forest)"] = {
		{ids="7946"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Yebb Neblegear Turn-Ins (Elwynn Forest)"] = {
		{ids="7899,7900,7901,7902,8222,8223"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Chronos Turn-Ins (Mulgore)"] = {
		{ids="7881,7882,7883,7884,7885,7941"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Kerri Hicks Turn-Ins (Mulgore)"] = {
		{ids="7889,7890,7891,7892,7893,7939"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Rinling Turn-Ins (Mulgore)"] = {
		{ids="7894,7895,7896,7897,7898,7942"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Sayge's Fortunes (Mulgore)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Spawn of Jubjub (Mulgore)"] = {
		{ids="7946"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Yebb Neblegear Turn-Ins (Mulgore)"] = {
		{ids="7899,7900,7901,7902,8222,8223"},
	},
	["EVENTS\\Feast of Winter Veil\\Feast of Winter Veil Quest"] = {
		{ids="7062,7063,7022,7025,7042,7043,7045,8762"},
	},
	["EVENTS\\Hallow's End\\Hallow's End Quests"] = {
		{ids="8311,8356,8353,8355,8357,8373"},
	},
	["EVENTS\\Harvest Festival\\Harvest Festival Quest"] = {
		{ids="8149"},
	},
	["EVENTS\\Love is in the Air\\Gift Giving"] = {
		{ids="8993,8993,8993"},
	},
	["EVENTS\\Love is in the Air\\Love is in the Air Quests"] = {
		{ids="8903,9024,9025,9026,9027,9028,9029"},
	},
	["EVENTS\\Lunar Festival\\Lunar Festival Main Questline"] = {
		{ids="8870,8867,8883,8864,8865,8863,8862"},
	},
	["EVENTS\\Lunar Festival\\Lunar Festival Optimized Elders Path"] = {
		{ids="8714,8722,8652,8648,8645,8650,8688,8643,8642,8866,8653,8651,8683,8636,8646,8649,8675,8647,8716,8674,8680,8670,8677,8717,8686,8673,8678,8682,8724,8684,8671,8681,8719,8654,8685,8679,8720,8672,8726,8723,8725,8721,8718,8715,8676,8635,8713,8619,8644,8727"},
	},
	["EVENTS\\Midsummer Fire Festival\\Midsummer Fire Festival Quests"] = {
		{ids="9365", cond_if=[[completedallq(9325,9324,9326)]]},
		{ids="9319,9326,9325,9324", cond_if=[[level >= 50]]},
		{ids="9367,9389,9388,9323,9322"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Cenarion Battlegear"] = {
		{ids="8800,8548,8572,8573,8574"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Cloak Quest"] = {
		{ids="8557", cond=[[Warrior]]},
		{ids="8695", cond=[[Paladin]]},
		{ids="8690", cond=[[Shaman]]},
		{ids="8693", cond=[[Rogue]]},
		{ids="8691", cond=[[Mage]]},
		{ids="8692", cond=[[Druid]]},
		{ids="8689", cond=[[Priest]]},
		{ids="8696", cond=[[Hunter]]},
		{ids="8694", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Ring Quest"] = {
		{ids="8556", cond=[[Warrior]]},
		{ids="8703", cond=[[Paladin]]},
		{ids="8698", cond=[[Shaman]]},
		{ids="8701", cond=[[Rogue]]},
		{ids="8699", cond=[[Mage]]},
		{ids="8700", cond=[[Druid]]},
		{ids="8697", cond=[[Priest]]},
		{ids="8704", cond=[[Hunter]]},
		{ids="8702", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Weapon Quest"] = {
		{ids="8558", cond=[[Warrior]]},
		{ids="8711", cond=[[Paladin]]},
		{ids="8706", cond=[[Shaman]]},
		{ids="8709", cond=[[Rogue]]},
		{ids="8707", cond=[[Mage]]},
		{ids="8708", cond=[[Druid]]},
		{ids="8705", cond=[[Priest]]},
		{ids="8712", cond=[[Hunter]]},
		{ids="8710", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Signet Ring of the Bronze Dragonflight"] = {
		{ids="8753,8754,8755,8756", cond_if=[[completedq(8752)]]},
		{ids="8758,8759,8760,8761", cond_if=[[completedq(8757)]]},
		{ids="8766", cond_if=[[completedq(8756)]]},
		{ids="8764", cond_if=[[completedq(8751)]]},
		{ids="8765", cond_if=[[completedq(8761)]]},
		{ids="8748,8749,8750,8751", cond_if=[[completedq(8747)]]},
		{ids="8757,8747,8752"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Boots Quest"] = {
		{ids="8559", cond=[[Warrior]]},
		{ids="8655", cond=[[Paladin]]},
		{ids="8621", cond=[[Shaman]]},
		{ids="8637", cond=[[Rogue]]},
		{ids="8634", cond=[[Mage]]},
		{ids="8665", cond=[[Druid]]},
		{ids="8596", cond=[[Priest]]},
		{ids="8626", cond=[[Hunter]]},
		{ids="8660", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Chest Quest"] = {
		{ids="8562,8562", cond=[[Warrior]]},
		{ids="8627,8627", cond=[[Paladin]]},
		{ids="8622,8622", cond=[[Shaman]]},
		{ids="8638,8638", cond=[[Rogue]]},
		{ids="8633,8633", cond=[[Mage]]},
		{ids="8666,8666", cond=[[Druid]]},
		{ids="8603,8603", cond=[[Priest]]},
		{ids="8656,8656", cond=[[Hunter]]},
		{ids="8661,8661", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Helm Quest"] = {
		{ids="8561", cond=[[Warrior]]},
		{ids="8628", cond=[[Paladin]]},
		{ids="8623", cond=[[Shaman]]},
		{ids="8639", cond=[[Rogue]]},
		{ids="8632", cond=[[Mage]]},
		{ids="8667", cond=[[Druid]]},
		{ids="8592", cond=[[Priest]]},
		{ids="8657", cond=[[Hunter]]},
		{ids="8662", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Legs Quest"] = {
		{ids="8560", cond=[[Warrior]]},
		{ids="8629", cond=[[Paladin]]},
		{ids="8624", cond=[[Shaman]]},
		{ids="8640", cond=[[Rogue]]},
		{ids="8631", cond=[[Mage]]},
		{ids="8668", cond=[[Druid]]},
		{ids="8593", cond=[[Priest]]},
		{ids="8658", cond=[[Hunter]]},
		{ids="8663", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Shoulder Quest"] = {
		{ids="8544", cond=[[Warrior]]},
		{ids="8630", cond=[[Paladin]]},
		{ids="8602", cond=[[Shaman]]},
		{ids="8641", cond=[[Rogue]]},
		{ids="8625", cond=[[Mage]]},
		{ids="8669", cond=[[Druid]]},
		{ids="8594", cond=[[Priest]]},
		{ids="8659", cond=[[Hunter]]},
		{ids="8664", cond=[[Warlock]]},
	},
	["LEVELING\\Arathi Highlands & Alterac Mountains (39-40)"] = {
		{ids="4487", cond_if=[[Warlock]]},
		{ids="1713,1792", cond_if=[[Warrior]]},
		{ids="691,642,651,657,660,661,500,537,512,603,551,1450,1451,1452,693,663,662,664,665,666,668,669,554"},
	},
	["LEVELING\\Ashenvale & Stonetalon Mountains (21-24)"] = {
		{ids="1738", cond_if=[[Warlock]]},
		{ids="741", cond_if=[[haveq(731) or completedq(731)]]},
		{ids="942", cond_if=[[haveq(741) or completedq(741)]]},
		{ids="1199,1198,1275,1200", cond_if=[[guideflag("BFDflag")]]},
		{ids="970,1010,1020,973,1008,1070,1056,991,1054,1033,1034,1023,1007,1009,1134,1085,1071,1093,1072,1075,1025,1016"},
	},
	["LEVELING\\Azshara & Felwood (52-52)"] = {
		{ids="8466", cond_if=[[rep('Timbermaw Hold') < Unfriendly]]},
		{ids="978,2943,3764,4493,5535,5536,4101,5155,4421,8460,8462,5157,4906,5156,939,3909,4441,5158"},
	},
	["LEVELING\\Badlands (41-42)"] = {
		{ids="705", cond_if=[[itemcount(4611) >= 9]]},
		{ids="713", cond_if=[[itemcount(3829) > 0]]},
		{ids="715", cond_if=[[itemcount(929) > 0 and itemcount(3823) > 0]]},
		{ids="714", cond_if=[[haveq(713) or completedq(713)]]},
		{ids="716", cond_if=[[itemcount(2868) > 0]]},
		{ids="734,777,778", cond_if=[[completedq(713) and completedq(714)]]},
		{ids="707,2500,738,719,718,720,733,703,1108,739,1137,710,711,712"},
	},
	["LEVELING\\Blasted Lands & Burning Steppes (51-51)"] = {
		{ids="3449", cond_if=[[not completedq(3451)]]},
		{ids="7803,7808", cond_if=[[itemcount(4306) >= 60]]},
		{ids="3501", cond_if=[[itemcount(10593) > 0]]},
		{ids="7802,7807", cond_if=[[itemcount(2592) >= 60]]},
		{ids="7811", cond_if=[[itemcount(14047) >= 60 and (completedq(7807) and completedq(7808) and completedq(7809))]]},
		{ids="2521", cond_if=[[itemcount(8244) > 0]]},
		{ids="7805", cond_if=[[itemcount(14047) >= 60 and (completedq(7802) and completedq(7803) and completedq(7804))]]},
		{ids="7804,7809", cond_if=[[itemcount(4338) >= 60]]},
		{ids="2783,2801,2581,2583,2585,2601,2603,3823,4512,3201,3448,3450,3790,3451,5090"},
	},
	["LEVELING\\Burning Steppes (56-57)"] = {
		{ids="4183,4184,4185,4186", cond_if=[[haveq(4182) or completedq(4182)]]},
		{ids="3702,3701,3824,4283,4182,4726,4296,4022,3825,6182,6183,6184,5048,5050,4223,4224,4808"},
	},
	["LEVELING\\Cenarion Field Duty Combat Assignments"] = {
		{ids="8773", cond_if=[[itemcount(21248) >= 1 or haveq(8773)]]},
		{ids="8771", cond_if=[[itemcount(21750) >= 1 or haveq(8771)]]},
		{ids="8501", cond_if=[[itemcount(20941) >= 1 or haveq(8501)]]},
		{ids="8777", cond_if=[[itemcount(21256) >= 1 or haveq(8777)]]},
		{ids="8776", cond_if=[[itemcount(21255) >= 1 or haveq(8776)]]},
		{ids="8775", cond_if=[[itemcount(21253) >= 1 or haveq(8775)]]},
		{ids="8774", cond_if=[[itemcount(21252) >= 1 or haveq(8774)]]},
		{ids="8770", cond_if=[[itemcount(21749) >= 1 or haveq(8770)]]},
		{ids="8687", cond_if=[[itemcount(21251) >= 1 or haveq(8687)]]},
		{ids="8502", cond_if=[[itemcount(20942) >= 1 or haveq(8502)]]},
		{ids="8772", cond_if=[[itemcount(21250) >= 1 or haveq(8772)]]},
		{ids="8539", cond_if=[[itemcount(21249) >= 1 or haveq(8539)]]},
		{ids="8507,8508"},
	},
	["LEVELING\\Cenarion Field Duty Logistics Assignments"] = {
		{ids="8778", cond_if=[[itemcount(21257) >= 1 or haveq(8778)]]},
		{ids="8497", cond_if=[[itemcount(20807) >= 1 or haveq(8497)]]},
		{ids="8783", cond_if=[[itemcount(21265) >= 1 or haveq(8783)]]},
		{ids="8541", cond_if=[[itemcount(20940) >= 1 or haveq(8541)]]},
		{ids="8782", cond_if=[[itemcount(21262) >= 1 or haveq(8782)]]},
		{ids="8780", cond_if=[[itemcount(21263) >= 1 or haveq(8780)]]},
		{ids="8829", cond_if=[[itemcount(21514) >= 1 or haveq(8829)]]},
		{ids="8805", cond_if=[[itemcount(20939) >= 1 or haveq(8805)]]},
		{ids="8781", cond_if=[[itemcount(21260) >= 1 or haveq(8781)]]},
		{ids="8496", cond_if=[[itemcount(20806) >= 1 or haveq(8496)]]},
		{ids="8779", cond_if=[[itemcount(21259) >= 1 or haveq(8779)]]},
		{ids="8507,8508"},
	},
	["LEVELING\\Cenarion Field Duty Tactical Assignments"] = {
		{ids="8738", cond_if=[[itemcount(21166) >= 1 or haveq(8738)]]},
		{ids="8536", cond_if=[[itemcount(21751) >= 1 or haveq(8536)]]},
		{ids="8740", cond_if=[[itemcount(20944) >= 1 or haveq(8740)]]},
		{ids="8498", cond_if=[[itemcount(20943) >= 1 or haveq(8498)]]},
		{ids="8739", cond_if=[[itemcount(21167) >= 1 or haveq(8739)]]},
		{ids="8538", cond_if=[[itemcount(20948) >= 1 or haveq(8538)]]},
		{ids="8537", cond_if=[[itemcount(20945) >= 1 or haveq(8537)]]},
		{ids="8535", cond_if=[[itemcount(20947) >= 1 or haveq(8535)]]},
		{ids="8534", cond_if=[[itemcount(21165) >= 1 or haveq(8534)]]},
		{ids="8737", cond_if=[[itemcount(21245) >= 1 or haveq(8737)]]},
		{ids="8507,8508"},
	},
	["LEVELING\\Darkshore (15-18)"] = {
		{ids="26,6121,29,6122,272", cond_if=[[Druid]]},
		{ids="2178", cond_if=[[skill("Cooking") >= 10]]},
		{ids="1141", cond_if=[[itemcount(12238) >= 6]]},
		{ids="983,2118,984,3524,1001,4681,963,2138,985,4761,4762,954,958,4811,955,956,957,4723,1002,4725,4727,4812,4813,953,4728,4722,1138,965,982,966,967"},
	},
	["LEVELING\\Darkshore (20-21)"] = {
		{ids="995", cond_if=[[hardcore()]]},
		{ids="994", cond_if=[[not hardcore()]]},
		{ids="968", cond_if=[[itemcount(5352) > 0]]},
		{ids="947,2139,986,4763,729,1003,2098,948,4740,993,944,4730,4731,4732,4733,731,949,950,945,5321"},
	},
	["LEVELING\\Desolace (35-37)"] = {
		{ids="1373", cond_if=[[not hardcore()]]},
		{ids="1454,1458,1387,1382,1437,1459,1465,5741,1455,6161,1456,1438,1439,1440,5501,5561,1384,6027,1370,1457,1114,1115,1186,1187"},
	},
	["LEVELING\\Desolace (40-41)"] = {
		{ids="1374", cond_if=[[not hardcore()]]},
		{ids="1052,1053", cond_if=[[guideflag("SMflag")]]},
		{ids="261,1466,6134,1118,1106,1188,1467"},
	},
	["LEVELING\\Druid Class Quests"] = {
		{ids="5921,5929,5931,6001,6121,6122,6123,6124,6125,26,29,272,5061,9063,9052,9051,9053", cond_if=[[NightElf Druid]]},
		{ids="5923", cond_if=[[NightElf Druid and (not completedq(5921)) and (not haveq(5921))]]},
	},
	["LEVELING\\Duskwood & Redridge Mountains (25-27)"] = {
		{ids="5061", cond_if=[[Druid]]},
		{ids="2359,2607,2608", cond_if=[[Rogue]]},
		{ids="391,387", cond=[[guideflag("Stockflag")]]},
		{ids="377,388", cond_if=[[guideflag("Stockflag")]]},
		{ids="389", cond_if=[[completedq(373) and guideflag("Stockflag")]]},
		{ids="1651,1652", cond_if=[[Paladin]]},
		{ids="66,101,56,67,163,165,164,174,175,177,5,95,226,148,68,93,240,57,69,149,154,157,230,158,262,70,72,74,335,20,127,150,34,265,266,156,453,268,323,269,159,128,126,91,180,219,2923,270"},
	},
	["LEVELING\\Duskwood & Stranglethorn Vale (30-32)"] = {
		{ids="690,1301,336", cond_if=[[Mage]]},
		{ids="690,1301,336", cond_if=[[not Mage]]},
		{ids="1718", cond_if=[[Warrior]]},
		{ids="1798", cond_if=[[Warlock]]},
		{ids="538", cond_if=[[haveq(337) or completedq(337)]]},
		{ids="337", cond_if=[[itemcount(2794) > 0]]},
		{ids="1274,325,1241,1242,1243,181,173,58,1244,221,337,75,78,133,134,160,225,79,80,97,227,251,401,252,98,222,1245,215,583,185,190,223,1246,1447,1247,1248,538,1302,1249,1250,1264"},
	},
	["LEVELING\\Dustwallow Marsh & Thousand Needles (33-34)"] = {
		{ids="1719,1791", cond_if=[[Warrior]]},
		{ids="1324,1267", cond_if=[[not hardcore()]]},
		{ids="1758", cond_if=[[Warlock]]},
		{ids="1135,1282,1265,1266,1266,1218,1219,1177,1284,1252,1253,1100,1110,1104,1105,1176,1175,1111,5762,1178,1220,1259,1319,1285,1320,1180,1112,1040"},
	},
	["LEVELING\\Dustwallow Marsh (40-40)"] = {
		{ids="1661", cond_if=[[Paladin]]},
		{ids="1050", cond_if=[[guideflag("SMflag")]]},
		{ids="4490", cond_if=[[Warlock]]},
		{ids="1203", cond_if=[[itemcount(3853) > 0]]},
		{ids="1286,1204,1206,1222,1324,1267,1287,1258"},
	},
	["LEVELING\\Dwarf & Gnome Starter (1-13)"] = {
		{ids="3112", cond=[[Gnome Warrior]]},
		{ids="1638,1639,1640,1665", cond_if=[[Warrior]]},
		{ids="184", cond_if=[[itemcount(1972) > 0]]},
		{ids="5625", cond_if=[[Priest]]},
		{ids="3108", cond=[[Dwarf Hunter]]},
		{ids="5637", cond_if=[[Dwarf Priest]]},
		{ids="3107", cond=[[Dwarf Paladin]]},
		{ids="3113", cond=[[Gnome Rogue]]},
		{ids="6387,6391,6388,6392", cond_if=[[Dwarf or Gnome]]},
		{ids="3109", cond=[[Dwarf Rogue]]},
		{ids="3110", cond=[[Dwarf Priest]]},
		{ids="1599,1715", cond_if=[[Gnome Warlock]]},
		{ids="3115,1688,1689", cond=[[Gnome Warlock]]},
		{ids="3106", cond=[[Dwarf Warrior]]},
		{ids="2999,1645,1646,1647,1648,1778,1779,1783,1784,1785", cond_if=[[Dwarf Paladin]]},
		{ids="6064,6084,6085,6086", cond_if=[[Hunter]]},
		{ids="308", cond_if=[[haveq(310)]]},
		{ids="3114", cond=[[Gnome Mage]]},
		{ids="179,233,170,234,183,3364,3361,3365,182,218,282,420,2160,384,400,317,313,5541,287,318,412,312,319,315,310,311,320,413,291,433,432,419,417,414,224,267,1339,1338,6661,6662,353,40,35,37,52,45,5545,71,83,39,109,244,418,416"},
	},
	["LEVELING\\Feralas & Azshara (52-53)"] = {
		{ids="7735", cond_if=[[itemcount(18969) == 0 and not (readyq(7733) or completedq(7733))]]},
		{ids="7733,2879,7003,7721,2844,2942,2845,4502,3601,5534,3461"},
	},
	["LEVELING\\Feralas & Tanaris (44-48)"] = {
		{ids="2750", cond_if=[[itemcount(8646) > 0]]},
		{ids="2749", cond_if=[[itemcount(8645) > 0]]},
		{ids="3527,2768,2865,3042", cond_if=[[guideflag("ZFflag")]]},
		{ids="2748", cond_if=[[itemcount(8644) > 0]]},
		{ids="2747", cond_if=[[itemcount(8643) > 0]]},
		{ids="3022,2821,4124,2866,2939,2982,4125,2867,3130,2869,2870,2766,4127,4129,4130,4131,2871,2969,2970,2972,4135,4281,4265,3445,4266,4267,3661,2940,2941,2741,2944,992,82"},
	},
	["LEVELING\\Hillsbrad Foothills & Arathi Highlands (32-33)"] = {
		{ids="564,536,555,559,560,561,562,659,505,510,511,563,514,681,658,700"},
		{ids="565", cond_if=[[itemcount(3719) > 0 and itemcount(2997) > 0]]},
	},
	["LEVELING\\Human Starter (1-13)"] = {
		{ids="3101,1641,1642,1643,1644", cond_if=[[Human Paladin]]},
		{ids="3103,5623,5624,5635", cond_if=[[Human Priest]]},
		{ids="3905", cond_if=[[haveq(3904) or completedq(3904)]]},
		{ids="1598,3105,1685,1689", cond_if=[[Human Warlock]]},
		{ids="3104", cond_if=[[Human Mage]]},
		{ids="2205", cond_if=[[Rogue]]},
		{ids="1688", cond=[[Human Warlock]]},
		{ids="6181,6281,6261,6285", cond_if=[[Human]]},
		{ids="3102", cond_if=[[Human Rogue]]},
		{ids="184", cond_if=[[itemcount(1972) > 0]]},
		{ids="3100,1638,1639,1640,1665", cond_if=[[Human Warrior]]},
		{ids="783,7,5261,33,15,21,18,3903,6,3904,54,2158,62,60,47,85,86,106,111,84,107,87,40,35,76,61,112,37,52,45,5545,71,83,39,109,114,239,1097,11,64,36,151,9,38,22,12,102,353,6661,287,412,312,291,433,432,419,417,418,416,1339,1338,224,267"},
	},
	["LEVELING\\Hunter Class Quests"] = {
		{ids="6063,6101,6102,6103", cond_if=[[NightElf Hunter]]},
		{ids="6064,6084,6085,6086", cond_if=[[Dwarf Hunter]]},
		{ids="8151,8153,8231,8232,7632,7633,7636,7635", cond_if=[[Hunter]]},
	},
	["LEVELING\\Loch Modan (18-19)"] = {
		{ids="436,307,250,199,385,297,298,301"},
	},
	["LEVELING\\Mage Class Quests"] = {
		{ids="1860,1861,1920,1921,1941,1939,1938,1940,1942,1947,1949,1950,1951,1948,1952,1953,1954,1955,1956,1957,1958,2861,2846,7463", cond_if=[[Mage]]},
		{ids="1919", cond_if=[[Human Mage]]},
		{ids="1919", cond_if=[[Gnome Mage]]},
	},
	["LEVELING\\Night Elf Starter (1-13)"] = {
		{ids="3117,6063,6101,6102,6103", cond_if=[[NightElf Hunter]]},
		{ids="1684,1683,1638,1639,1640,1665", cond_if=[[Warrior]]},
		{ids="3118,77573,2241,2242", cond_if=[[NightElf Rogue]]},
		{ids="2178", cond_if=[[skill("Cooking") >= 10]]},
		{ids="3119,5629,5627", cond_if=[[NightElf Priest]]},
		{ids="6071", cond_if=[[Hunter]]},
		{ids="6344,6341,6342,6343", cond_if=[[NightElf]]},
		{ids="5622,5621", cond_if=[[Priest]]},
		{ids="3120,5921,5929,5931,6001", cond_if=[[NightElf Druid]]},
		{ids="3116", cond_if=[[NightElf Warrior]]},
		{ids="456,4495,458,457,459,916,3519,917,3521,920,921,3522,928,2159,488,997,475,932,2438,929,918,919,922,476,489,2459,933,4161,930,7383,487,937,931,938,940,923,952,2518,935,2520,3524,983,2118,984,4681,4761,954,955,956,957,433,432,419,417,1339,1338,6661,6662,353"},
	},
	["LEVELING\\Paladin Class Quests"] = {
		{ids="1641,1642,1643,1644,1780,1781,1786,1787,1788", cond_if=[[Human Paladin]]},
		{ids="1794,1793,1649,1650,1651,1652,1653,1654,1655,1442,1442,1806,1661,8415,8414,8416,8418,7638,7637,7639,7640,7641,7642,7648,7643,7645,7644,7646,7647", cond_if=[[Paladin]]},
		{ids="2997,1645,1646,1646,1647,1648,1778,1779,1783,1784,1785", cond_if=[[Dwarf Paladin]]},
	},
	["LEVELING\\Priest Class Quests"] = {
		{ids="5637,5641", cond_if=[[Dwarf Priest]]},
		{ids="5637,5676", cond_if=[[Human Priest]]},
		{ids="5629,5672", cond_if=[[NightElf Priest]]},
	},
	["LEVELING\\Redridge & Westfall (19-20)"] = {
		{ids="1793,1649", cond_if=[[Paladin]]},
		{ids="2360,2281,2282", cond_if=[[Rogue]]},
		{ids="1716", cond_if=[[Warlock]]},
		{ids="244", cond_if=[[NightElf]]},
		{ids="971", cond_if=[[guideflag("BFDflag")]]},
		{ids="167,168,2040,166,214,373", cond_if=[[guideflag("DMflag")]]},
		{ids="125,118,120,129,132,92,3741,135,121,141,142,103,104,155,246,130,3765,119,94,89,122,124,131"},
	},
	["LEVELING\\Rogue Class Quests"] = {
		{ids="2218,2238,2239,2360,2359,2607,2608,8233,8234,3503,8235,3421,3503,8236", cond_if=[[Rogue]]},
	},
	["LEVELING\\Scepter of the Shifting Sands"] = {
		{ids="8286,8288,8301,8302,8303,8305,8519,8555,8575,8576,8577,8584,8597,8599,8598,8606,8585,8586,8620,8578,8733,8734,8735,8736,8741,8587,8730,8728,8729,8742,8743,8745"},
	},
	["LEVELING\\Scourge Invasion"] = {
		{ids="9154,9247,9153,9260,9261,9262,9299,9295,9301,9300,9302,9304"},
	},
	["LEVELING\\Searing Gorge (50-51)"] = {
		{ids="7793", cond_if=[[itemcount(4306) >= 60]]},
		{ids="7794", cond_if=[[itemcount(4338) >= 60]]},
		{ids="7795", cond_if=[[itemcount(14047) >= 60 and (completedq(7791) and completedq(7793) and completedq(7794))]]},
		{ids="7791", cond_if=[[itemcount(2592) >= 60]]},
		{ids="7723,7724,7727,7728,7729,3441,3442,3443,4451,3452,3453,3454,3462,3463,4449,3181,3367,3368,3481,3182"},
	},
	["LEVELING\\Season of Discovery Events\\Blackrock Eruption"] = {
		{ids="84349,84355,84351,84348,84372,84356,84360,84359,84350"},
	},
	["LEVELING\\Silithus (59-60)"] = {
		{ids="8308", cond_if=[[itemcount(20461) > 0]]},
		{ids="1125,8277,8280,8284,8318,8304,8278,8281,8285,8279,8287"},
	},
	["LEVELING\\Stonetalon Mountains & Ashenvale (29-30)"] = {
		{ids="2928,2924,2922,2927,2930,2929,2926", cond_if=[[guideflag("Gnomerflag")]]},
		{ids="2945", cond_if=[[itemcount(9326) > 0 and guideflag("Gnomerflag")]]},
		{ids="2947,2952", cond_if=[[(haveq(2945) or completedq(2945)) and guideflag("Gnomerflag")]]},
		{ids="2948", cond_if=[[(haveq(2947) or completedq(2947)) and guideflag("Gnomerflag")]]},
		{ids="1057,1059,1140,1022,1021,4581,1024,1035,1026,1031,1011,1037,1032,1027,1028,1055,1029,1030,1045,1046,1038,1039,683,686,689,1179"},
	},
	["LEVELING\\Stranglethorn Vale (34-35)"] = {
		{ids="1712", cond_if=[[Warrior]]},
		{ids="1181,1041,605,201,198,616,213,1182,578,575,203,204,200,186,191,328,210,187,194,1183,1042,1043,1453"},
	},
	["LEVELING\\Stranglethorn Vale (37-38)"] = {
		{ids="627", cond_if=[[itemcount(4278) >= 4]]},
		{ids="622", cond_if=[[haveq(627) or completedq(627)]]},
		{ids="189,601,577,207,574,195,188,192,329,196,193,205,330,331,1116,602"},
	},
	["LEVELING\\Stranglethorn Vale (42-43)"] = {
		{ids="341", cond_if=[[itemcount(2742) > 0 and itemcount(2744) > 0 and itemcount(2745) > 0 and itemcount(2748) > 0]]},
		{ids="339", cond_if=[[itemcount(2725) > 0 and itemcount(2728) > 0 and itemcount(2730) > 0 and itemcount(2732) > 0]]},
		{ids="342", cond_if=[[itemcount(2749) > 0 and itemcount(2750) > 0 and itemcount(2751) > 0]]},
		{ids="340", cond_if=[[itemcount(2734) > 0 and itemcount(2735) > 0 and itemcount(2738) > 0 and itemcount(2740) > 0]]},
		{ids="1477,1364,209,610,600,621,606,595,628,597,607,599,609,611,617,197,587,604,623,576,338"},
	},
	["LEVELING\\Stranglethorn Vale (50-50)"] = {
		{ids="624,624,624", cond_if=[[itemcount(4056) > 0]]},
		{ids="608,594,208,625,626"},
	},
	["LEVELING\\Swamp of Sorrows (38-39)"] = {
		{ids="1260,1363,1364", cond_if=[[Mage]]},
		{ids="1393", cond_if=[[not hardcore()]]},
		{ids="1363,1260,1448,1396,1392,1389,1421,1117,1449,525"},
	},
	["LEVELING\\Swamp of Sorrows (43-43)"] = {
		{ids="1398,1425,1395,580,1119,2864,2872"},
	},
	["LEVELING\\Tanaris (43-44)"] = {
		{ids="1191", cond_if=[[haveq(1190)]]},
		{ids="1189,1120,1122,1190,1194,1707,1690,8365,3520,8366,2873"},
	},
	["LEVELING\\Tanaris (49-49)"] = {
		{ids="2876,351", cond_if=[[level < 50]]},
		{ids="1691,2781,2875,10,3161,2874,2605,110,113,3362,5863"},
	},
	["LEVELING\\The Hinterlands (48-49)"] = {
		{ids="2988,1469,2880,2877,2989,485"},
	},
	["LEVELING\\Un'Goro Crater (49-50)"] = {
		{ids="7065,7041,7028,7067,7044,7046,7066", cond_if=[[guideflag("Maraflag")]]},
		{ids="4289,4290,3844,3845,4291,4292,3884,3908,4284,4141,4142,2606,2641,162,3444"},
	},
	["LEVELING\\Un'Goro Crater (53-54)"] = {
		{ids="4245", cond_if=[[haveq(4244) or completedq(4244)]]},
		{ids="4244", cond_if=[[(itemcount(10561) > 0) or (haveq(4244) or completedq(4244))]]},
		{ids="7800", cond_if=[[itemcount(14047) >= 60 and (completedq(10352) and completedq(10354) and completedq(7799))]]},
		{ids="7799", cond_if=[[itemcount(4338) >= 60]]},
		{ids="10354", cond_if=[[itemcount(4306) >= 60]]},
		{ids="10352", cond_if=[[itemcount(2592) >= 60]]},
		{ids="4504,2661,4496,2662,3881,3883,3882,4285,4287,4288,4501,4492,4503,4301,974,980,4491,4321,4243,3908,5159,1047,6761,3781,6762,979,5250"},
	},
	["LEVELING\\Warlock Class Quests"] = {
		{ids="1688,1689", cond=[[Human Warlock]]},
		{ids="1685", cond_if=[[(Human Warlock) and not haveq(1688) and not completedq(1688)]]},
		{ids="1717", cond_if=[[Warlock and not haveq(1716) and not completedq(1716)]]},
		{ids="1599,1715,1688,1689", cond_if=[[Gnome Warlock]]},
		{ids="1716,1738,1739,1798,1758,1802,1804,1471,4487,4488,4490,7601,7602,8420,8421,8421,8422,7603,7562,7563,7564,7623,7626,7627,7628,7630,7624,7625,7629,7631", cond_if=[[Warlock]]},
		{ids="1598", cond_if=[[Human Warlock]]},
	},
	["LEVELING\\Warrior Class Quests"] = {
		{ids="1718,1719,1791,1712,1714,1713,1792,8417,8423,8424,8425", cond_if=[[Warrior]]},
		{ids="1638,1639,1640,1665", cond_if=[[Human Warrior]]},
		{ids="1679,1678", cond_if=[[(Dwarf Warrior) or (Gnome Warrior)]]},
		{ids="1684,1683", cond_if=[[NightElf Warrior]]},
	},
	["LEVELING\\Western & Eastern Plaguelands (57-58)"] = {
		{ids="7261,5219,5097,5142,4984,5058,5060,5220,5051,5533,5222,5903,6185,5223,4985,5542,5543,5544,5149,5152,5241,6021,5281,5211,6164,5742,5225,5537,6186,5904,5153,5154,4971,5210,4972,5181,5226,4986,6389,6004,6023,5237,8275"},
	},
	["LEVELING\\Western Plaguelands (51-52)"] = {
		{ids="5092,5401,5215,5216,5217,5021,5022"},
	},
	["LEVELING\\Westfall (13-15)"] = {
		{ids="153,65"},
		{ids="64,109,36,151,9,38,22,12,102", cond_if=[[Dwarf or Gnome or NightElf]]},
	},
	["LEVELING\\Wetlands (24-25)"] = {
		{ids="1650", cond_if=[[Paladin]]},
		{ids="2360", cond_if=[[Rogue]]},
		{ids="1739", cond_if=[[Warlock]]},
		{ids="1073", cond_if=[[completedq(1072) and (itemcount(2458) >= 2 and itemcount(2455) >= 4)]]},
		{ids="943", cond_if=[[haveq(942) or completedq(942)]]},
		{ids="484,279,288,463,470,305,294,306,469,276,277"},
	},
	["LEVELING\\Wetlands (27-29)"] = {
		{ids="281,471,289,472,464,284,285,286,295,299,296,275,290,465,292,631,632,633,637,634,293,321,324,322"},
	},
	["LEVELING\\Winterspring & Felwood (54-56)"] = {
		{ids="3913", cond_if=[[not hardcore()]]},
		{ids="3913", cond_if=[[hardcore()]]},
		{ids="8471", cond_if=[[itemcount(20742) > 0 and level < 56.10]]},
		{ids="8467", cond_if=[[itemcount(21377) >= 5]]},
		{ids="8470", cond_if=[[level < 56.10]]},
		{ids="5165,4442,5882,5202,8461,8465,3912,5082,5083,5084,5085,5086,3914,3941,3942,4084,5087,4842,5244,5245,4861,6028,6030,4863,4864,4901,8464,4902"},
	},
	["LEVELING\\Winterspring (58-59)"] = {
		{ids="4809,3783,977,5163,1124,5527,4005,3961"},
	},
	["PROFESSIONS\\Blacksmithing\\Blacksmithing (1-300)"] = {
		{ids="7652,7655,7654"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Armorsmith\\Armorsmith Questline"] = {
		{ids="5283,2758,2759,2760,2761,2762,2763,2765,2764,2771,2772,2773,3321"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Axesmith Questline"] = {
		{ids="5306"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Hammersmith Questline"] = {
		{ids="5305"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Swordsmith Questline"] = {
		{ids="5307"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Weaponsmith Questline"] = {
		{ids="5284"},
	},
	["PROFESSIONS\\Cooking\\Cooking (1-300)"] = {
		{ids="6612,6610"},
	},
	["PROFESSIONS\\Cooking\\Cooking + Fishing (1-300)"] = {
		{ids="6609,6607,6610"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Gnomish Engineering\\Gnome Engineer Membership Card Renewal"] = {
		{ids="3647"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Gnomish Engineering\\Gnomish Engineering Questline"] = {
		{ids="3632,3640,3641"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineer Membership Card Renewal"] = {
		{ids="3644"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineering Questline"] = {
		{ids="4181,3638,3639"},
	},
	["PROFESSIONS\\First Aid\\First Aid (1-300)"] = {
		{ids="6624"},
	},
	["PROFESSIONS\\Fishing\\Fishing (1-300)"] = {
		{ids="6609,6607"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Dragonscale Leatherworking\\Dragonscale Leatherworking Questline"] = {
		{ids="5141"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Elemental Leatherworking\\Elemental Leatherworking Questline"] = {
		{ids="5144"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Tribal Leatherworking\\Tribal Leatherworking Questline"] = {
		{ids="2847,2848,2849,2850,2851,2852,2853,5143"},
	},
	["PROFESSIONS\\Lockpicking\\Lockpicking (1-300)"] = {
		{ids="2281,2282"},
	},
	["REPUTATIONS\\Reputations\\Argent Dawn"] = {
		{ids="5401"},
	},
	["REPUTATIONS\\Reputations\\Bloodsail Buccaneers"] = {
		{ids="1036,9272,4621"},
	},
	["REPUTATIONS\\Reputations\\Brood of Nozdormu"] = {
		{ids="8579", cond_if=[[not completedq(8579)]]},
	},
	["REPUTATIONS\\Reputations\\Cenarion Circle"] = {
		{ids="8318"},
	},
	["REPUTATIONS\\Reputations\\Darnassus"] = {
		{ids="7799", cond_if=[[not completedq(7799)]]},
		{ids="7792", cond_if=[[not completedq(7792)]]},
		{ids="7798", cond_if=[[not completedq(7798)]]},
		{ids="7800", cond_if=[[not completedq(7800)]]},
	},
	["REPUTATIONS\\Reputations\\Gelkis & Magram Centaur Clans"] = {
		{ids="1368,1367", cond_if=[[Horde]]},
		{ids="1382,1385", cond_if=[[Alliance]]},
	},
	["REPUTATIONS\\Reputations\\Gnomeregan Exiles"] = {
		{ids="7808", cond_if=[[not completedq(7808)]]},
		{ids="7809", cond_if=[[not completedq(7809)]]},
		{ids="7811", cond_if=[[not completedq(7811)]]},
		{ids="7807", cond_if=[[not completedq(7807)]]},
	},
	["REPUTATIONS\\Reputations\\Ironforge"] = {
		{ids="7803", cond_if=[[not completedq(7803)]]},
		{ids="7802", cond_if=[[not completedq(7802)]]},
		{ids="7804", cond_if=[[not completedq(7804)]]},
		{ids="7805", cond_if=[[not completedq(7805)]]},
	},
	["REPUTATIONS\\Reputations\\Steamwheedle Cartel"] = {
		{ids="7725", cond_if=[[not rep("Steamwheedle Cartel") == Exalted]]},
		{ids="7003"},
	},
	["REPUTATIONS\\Reputations\\Stormwind City"] = {
		{ids="7794", cond_if=[[not completedq(7794)]]},
		{ids="7793", cond_if=[[not completedq(7793)]]},
		{ids="7795", cond_if=[[not completedq(7795)]]},
		{ids="7791", cond_if=[[not completedq(7791)]]},
	},
	["REPUTATIONS\\Reputations\\Thorium Brotherhood"] = {
		{ids="7723,7724,7727,7722,7728,7729"},
	},
	["REPUTATIONS\\Reputations\\Timbermaw Hold"] = {
		{ids="8470", cond_if=[[itemcount(20741) > 0]]},
		{ids="8460,8462,8461,8465,8464"},
	},
	["REPUTATIONS\\Reputations\\Wintersaber Trainers"] = {
		{ids="8464,5201,5981", cond_if=[[rep('Wintersaber Trainers') < Exalted]]},
		{ids="4970", cond_if=[[repval('Wintersaber Trainers','Neutral') < 1500]]},
	},
}
GQ.Quest_Cache_Turnin_Alliance = {
	["DUNGEONS\\Blackfathom Deeps Quests"] = {
		{ids="3765,1198,1275,1199,1200,971"},
	},
	["DUNGEONS\\Blackrock Depths Quests"] = {
		{ids="3702,4128,4182,3701,4183,4184,4185,4186,4223,4224,3441,3442,3443,3452,3453,3454,3462,3463,3481,4324,4022,3801,4341,4342,4241,4264,3802,4282,4322,4242,4286,4262,4361,4126,4123,4136,4024,4201,4362,4263,4363"},
	},
	["DUNGEONS\\Dire Maul East Quests"] = {
		{ids="5527,7488,7441,5526"},
	},
	["DUNGEONS\\Dire Maul North Quests"] = {
		{ids="5518,7429,7703,7482"},
	},
	["DUNGEONS\\Dire Maul North Tribute (58-60)"] = {
		{ids="1193"},
	},
	["DUNGEONS\\Dire Maul West Quests"] = {
		{ids="7461,7462"},
	},
	["DUNGEONS\\Gnomeregan Quests"] = {
		{ids="2925,2923,2927,2926,2924,2922,2930,2929,2962,2928"},
	},
	["DUNGEONS\\Lower Blackrock Spire Quests"] = {
		{ids="3520,3527,4787,3528,5065,5001,5002,4867,4742,5081,4701,4866,4729,4862,4788"},
	},
	["DUNGEONS\\Maraudon Quests"] = {
		{ids="7044,7046,7067,7028,7041,7065,7070,7066"},
	},
	["DUNGEONS\\Raid Attunements\\Blackwing Lair Attunement"] = {
		{ids="7761"},
	},
	["DUNGEONS\\Raid Attunements\\Molten Core Attunement"] = {
		{ids="7848"},
	},
	["DUNGEONS\\Raid Attunements\\Naxxramas Attunement"] = {
		{ids="9123", cond_if=[[haveq(9123) or completedq(9123)]]},
		{ids="9122", cond_if=[[haveq(9122) or completedq(9122)]]},
		{ids="9121", cond_if=[[haveq(9121) or completedq(9121)]]},
	},
	["DUNGEONS\\Raid Attunements\\Onyxia's Lair Attunement"] = {
		{ids="4182,4183,4184,4185,4186,4223,4224,4241,4242,4264,4282,4322,6402,6403,6501,6502"},
	},
	["DUNGEONS\\Razorfen Downs Quests"] = {
		{ids="6626,3523,3525,3636"},
	},
	["DUNGEONS\\Razorfen Kraul Quests"] = {
		{ids="1100,1144,1221,1101,1142"},
	},
	["DUNGEONS\\Scarlet Monastery Armory Quests"] = {
		{ids="6141,261,1052,1053"},
	},
	["DUNGEONS\\Scarlet Monastery Cathedral Quests"] = {
		{ids="6141,261,1052,1053"},
	},
	["DUNGEONS\\Scarlet Monastery Library Quests"] = {
		{ids="6141,261,1052,1053,1050"},
	},
	["DUNGEONS\\Scholomance Quests"] = {
		{ids="4726,4808,4809,4810,4907,4734,4735,5522,5531,5091,5092,5097,5533,5537,5538,5801,5803,5382,5343,5529,4771,5515,5582,5384,5461,5462,5463,5463,5465,5466"},
	},
	["DUNGEONS\\Stratholme - Live Side Quests"] = {
		{ids="5281,5542,5543,5544,5742,5781,5845,5846,5282,5848,5214,5251,5262"},
	},
	["DUNGEONS\\Stratholme - Undead Side Quests"] = {
		{ids="5382,5515,5384,5461,5462,5251,5262,5463,5263,5212,5464,5243,5213"},
	},
	["DUNGEONS\\Temple of Atal'Hakkar Quests"] = {
		{ids="1448,1449,1450,1451,1452,1469,3445,3444,3520,3527,4787,4141,4142,3446,3447,3373,1475,1446,4143,3528"},
	},
	["DUNGEONS\\The Deadmines Quests"] = {
		{ids="65,132,135,141,142,155,166,214,373,2040,167,168"},
	},
	["DUNGEONS\\The Stockade Quests"] = {
		{ids="303,373,389,391,387,388,377,386,378"},
	},
	["DUNGEONS\\Tier 0.5 Dungeon Gear Questline"] = {
		{ids="8990", cond_if=[[haveq(8990)]]},
		{ids="8911,8936,8958,9005", cond_if=[[Warlock]]},
		{ids="8969", cond_if=[[haveq(8969)]]},
		{ids="8989", cond_if=[[haveq(8989)]]},
		{ids="8988", cond_if=[[haveq(8988)]]},
		{ids="8909,8934,8955,9003", cond_if=[[Priest]]},
		{ids="8905,8926,8951,8999", cond_if=[[Druid]]},
		{ids="8965", cond_if=[[haveq(8965)]]},
		{ids="8987", cond_if=[[haveq(8987)]]},
		{ids="8963", cond_if=[[haveq(8963)]]},
		{ids="8985", cond_if=[[haveq(8985)]]},
		{ids="8986", cond_if=[[haveq(8986)]]},
		{ids="8907,8932,8953,9001", cond_if=[[Mage]]},
		{ids="8992", cond_if=[[haveq(8992)]]},
		{ids="8991", cond_if=[[haveq(8991)]]},
		{ids="8967", cond_if=[[haveq(8967)]]},
		{ids="8906,8931,8952,9000", cond_if=[[Hunter]]},
		{ids="8908,8933,8954,9002", cond_if=[[Paladin]]},
		{ids="8910,8935,8956,9004", cond_if=[[Rogue]]},
		{ids="8966", cond_if=[[haveq(8966)]]},
		{ids="8964", cond_if=[[haveq(8964)]]},
		{ids="8912,8937,8959,9006", cond_if=[[Warrior]]},
		{ids="8968", cond_if=[[haveq(8968)]]},
		{ids="8962", cond_if=[[haveq(8962)]]},
		{ids="8922,8921,8924,8925,8928,8977,8929,8945,8946,8947,8948,8949,8950,9015,8960,8961,8970,8994,8995,8996,8997"},
	},
	["DUNGEONS\\Uldaman Quests"] = {
		{ids="2278,2279", cond_if=[[level >=40]]},
		{ids="2198,2199,720,721,722,723,724,725,726,707,738,738,2500,762,2200,2398,2201,704,17,3448,2439,2204,2240,1139"},
	},
	["DUNGEONS\\Upper Blackrock Spire Quests"] = {
		{ids="4766,4182,4183,4184,4185,4186,4223,4224,4241,4242,4264,4282,4322,6402,6403,4726,4808,4809,6501,4810,4907,6804,6805,5089,4734,4764,5102,5047,6502,5162,5164,6821,4735"},
	},
	["DUNGEONS\\Wailing Caverns Quests"] = {
		{ids="6981", cond_if=[[haveq(6981) or completedq(6981)]]},
		{ids="3366", cond_if=[[haveq(3366) or completedq(3366)]]},
		{ids="865,1486,1487,1491,959,3370"},
	},
	["DUNGEONS\\Zul'Farrak Quests"] = {
		{ids="2988,2989,2990,3520,3527,2768,2865,3042,2770,2846,2991"},
	},
	["EVENTS\\Children's Week\\Children's Week Main Questline"] = {
		{ids="1468,1479,1558,1687,4822,558,171"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Sayge's Fortunes (Elwynn Forest)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Sayge's Fortunes (Mulgore)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Feast of Winter Veil\\Feast of Winter Veil Quest"] = {
		{ids="7062,7063,7022,7025,7042,7043,7045,8762"},
	},
	["EVENTS\\Hallow's End\\Hallow's End Quests"] = {
		{ids="8356,8353,8355,8357,8311,8373"},
	},
	["EVENTS\\Harvest Festival\\Harvest Festival Quest"] = {
		{ids="8149"},
	},
	["EVENTS\\Love is in the Air\\Love is in the Air Quests"] = {
		{ids="8903,9024,9025,9026,9027,9028"},
	},
	["EVENTS\\Lunar Festival\\Lunar Festival Main Questline"] = {
		{ids="8870,8867,8883"},
	},
	["EVENTS\\Midsummer Fire Festival\\Midsummer Fire Festival Quests"] = {
		{ids="9319", cond_if=[[readyq(9319) or completedq(9319)]]},
		{ids="9324", cond_if=[[readyq(9324) or completedq(9324)]]},
		{ids="9325", cond_if=[[readyq(9325) or completedq(9325)]]},
		{ids="9326", cond_if=[[readyq(9326) or completedq(9326)]]},
		{ids="9367,9389,9388,9323,9322"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Cenarion Battlegear"] = {
		{ids="8800,8548,8572,8573,8574"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Cloak Quest"] = {
		{ids="8557", cond=[[Warrior]]},
		{ids="8695", cond=[[Paladin]]},
		{ids="8690", cond=[[Shaman]]},
		{ids="8693", cond=[[Rogue]]},
		{ids="8691", cond=[[Mage]]},
		{ids="8692", cond=[[Druid]]},
		{ids="8689", cond=[[Priest]]},
		{ids="8696", cond=[[Hunter]]},
		{ids="8694", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Ring Quest"] = {
		{ids="8556", cond=[[Warrior]]},
		{ids="8703", cond=[[Paladin]]},
		{ids="8698", cond=[[Shaman]]},
		{ids="8701", cond=[[Rogue]]},
		{ids="8699", cond=[[Mage]]},
		{ids="8700", cond=[[Druid]]},
		{ids="8697", cond=[[Priest]]},
		{ids="8704", cond=[[Hunter]]},
		{ids="8702", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Weapon Quest"] = {
		{ids="8558", cond=[[Warrior]]},
		{ids="8711", cond=[[Paladin]]},
		{ids="8706", cond=[[Shaman]]},
		{ids="8709", cond=[[Rogue]]},
		{ids="8707", cond=[[Mage]]},
		{ids="8708", cond=[[Druid]]},
		{ids="8705", cond=[[Priest]]},
		{ids="8712", cond=[[Hunter]]},
		{ids="8710", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Boots Quest"] = {
		{ids="8559", cond=[[Warrior]]},
		{ids="8655", cond=[[Paladin]]},
		{ids="8621", cond=[[Shaman]]},
		{ids="8637", cond=[[Rogue]]},
		{ids="8634", cond=[[Mage]]},
		{ids="8665", cond=[[Druid]]},
		{ids="8596", cond=[[Priest]]},
		{ids="8626", cond=[[Hunter]]},
		{ids="8660", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Helm Quest"] = {
		{ids="8561", cond=[[Warrior]]},
		{ids="8628", cond=[[Paladin]]},
		{ids="8623", cond=[[Shaman]]},
		{ids="8639", cond=[[Rogue]]},
		{ids="8632", cond=[[Mage]]},
		{ids="8667", cond=[[Druid]]},
		{ids="8592", cond=[[Priest]]},
		{ids="8657", cond=[[Hunter]]},
		{ids="8662", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Legs Quest"] = {
		{ids="8560", cond=[[Warrior]]},
		{ids="8629", cond=[[Paladin]]},
		{ids="8624", cond=[[Shaman]]},
		{ids="8640", cond=[[Rogue]]},
		{ids="8631", cond=[[Mage]]},
		{ids="8668", cond=[[Druid]]},
		{ids="8593", cond=[[Priest]]},
		{ids="8658", cond=[[Hunter]]},
		{ids="8663", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Shoulder Quest"] = {
		{ids="8544", cond=[[Warrior]]},
		{ids="8630", cond=[[Paladin]]},
		{ids="8602", cond=[[Shaman]]},
		{ids="8641", cond=[[Rogue]]},
		{ids="8625", cond=[[Mage]]},
		{ids="8669", cond=[[Druid]]},
		{ids="8594", cond=[[Priest]]},
		{ids="8659", cond=[[Hunter]]},
		{ids="8664", cond=[[Warlock]]},
	},
	["LEVELING\\Arathi Highlands & Alterac Mountains (39-40)"] = {
		{ids="1712,1713", cond_if=[[Warrior]]},
		{ids="642,658,657,660,691,661,525,602,500,537,512,551,1449,1450,1451,693,651,663,665,662,664,666,668,554"},
	},
	["LEVELING\\Ashenvale & Stonetalon Mountains (21-24)"] = {
		{ids="994,994", cond_if=[[not hardcore()]]},
		{ids="1716", cond_if=[[Warlock]]},
		{ids="995", cond_if=[[hardcore()]]},
		{ids="731", cond_if=[[haveq(731) or completedq(731)]]},
		{ids="741", cond_if=[[haveq(741) or completedq(741)]]},
		{ids="1198,1275,1199,1200", cond_if=[[guideflag("BFDflag")]]},
		{ids="967,1010,970,945,1020,1054,1033,973,991,1007,1009,1023,1034,1008,4730,4731,4732,4733,4740,1070,1085,1093,1071,1056,1134,1016,1025"},
	},
	["LEVELING\\Azshara & Felwood (52-52)"] = {
		{ids="3661,2944,3764,162,5535,5536,8460,5155,4421,8462,3908,5156,939,4906,5157,4101"},
	},
	["LEVELING\\Badlands (41-42)"] = {
		{ids="705", cond_if=[[readyq(705) or completedq(705)]]},
		{ids="716", cond_if=[[haveq(716) or completedq(716)]]},
		{ids="703", cond_if=[[readyq(703) or completedq(703)]]},
		{ids="714", cond_if=[[readyq(714) or completedq(714)]]},
		{ids="713", cond_if=[[haveq(713) or completedq(713)]]},
		{ids="734,777,778", cond_if=[[completedq(713) and completedq(714)]]},
		{ids="715", cond_if=[[haveq(715) or completedq(715)]]},
		{ids="1467,707,719,720,718,1106,738,1108,710,711,703,733,712,2500,739"},
	},
	["LEVELING\\Blasted Lands & Burning Steppes (51-51)"] = {
		{ids="3501", cond_if=[[haveq(3501) or completedq(3501)]]},
		{ids="2989", cond_if=[[haveq(2989) or completedq(2989)]]},
		{ids="2521", cond_if=[[haveq(2521) or completedq(2521)]]},
		{ids="2783,2801,2601,2603,2581,2583,2585,3823,3182,3368,3448,3450,3451,3201,2877,626"},
	},
	["LEVELING\\Burning Steppes (56-57)"] = {
		{ids="4182,4183,4184,4185", cond_if=[[haveq(4182) or completedq(4182)]]},
		{ids="3702,3461,4512,4022,3824,4283,6182,6183,5022,5048,4186,4223,4726,4296,3825,4224"},
	},
	["LEVELING\\Cenarion Field Duty Combat Assignments"] = {
		{ids="8687", cond_if=[[haveq(8687)]]},
		{ids="8771", cond_if=[[haveq(8771)]]},
		{ids="8770", cond_if=[[haveq(8770)]]},
		{ids="8501", cond_if=[[haveq(8501)]]},
		{ids="8773", cond_if=[[haveq(8773)]]},
		{ids="8539", cond_if=[[haveq(8539)]]},
		{ids="8775", cond_if=[[haveq(8775)]]},
		{ids="8777", cond_if=[[haveq(8777)]]},
		{ids="8776", cond_if=[[haveq(8776)]]},
		{ids="8774", cond_if=[[haveq(8774)]]},
		{ids="8772", cond_if=[[haveq(8772)]]},
		{ids="8502", cond_if=[[haveq(8502)]]},
		{ids="8507"},
	},
	["LEVELING\\Cenarion Field Duty Logistics Assignments"] = {
		{ids="8782", cond_if=[[haveq(8782)]]},
		{ids="8779", cond_if=[[haveq(8779)]]},
		{ids="8541,8805", cond_if=[[haveq(8541,8805)]]},
		{ids="8497", cond_if=[[haveq(8497)]]},
		{ids="8496", cond_if=[[haveq(8496)]]},
		{ids="8783", cond_if=[[haveq(8783)]]},
		{ids="8778", cond_if=[[haveq(8778)]]},
		{ids="8829", cond_if=[[haveq(8829)]]},
		{ids="8781,8780", cond_if=[[haveq(8781,8780)]]},
		{ids="8507"},
	},
	["LEVELING\\Cenarion Field Duty Tactical Assignments"] = {
		{ids="8739", cond_if=[[haveq(8739)]]},
		{ids="8537,8535", cond_if=[[haveq(8537,8535)]]},
		{ids="8737,8536", cond_if=[[haveq(8737,8536)]]},
		{ids="8538,8498", cond_if=[[haveq(8538,8498)]]},
		{ids="8534,8738,8740", cond_if=[[haveq(8534,8738,8740)]]},
		{ids="8507"},
	},
	["LEVELING\\Darkshore (15-18)"] = {
		{ids="26,6121,29", cond_if=[[Druid]]},
		{ids="1141", cond_if=[[readyq(1141) or completedq(1141)]]},
		{ids="2178", cond_if=[[skill("Cooking") >= 10]]},
		{ids="983", cond_if=[[readyq(983)]]},
		{ids="3524,4681,2118,984,4761,954,955,956,1001,1002,4723,4725,4727,4811,4762,2138,4812,953,4728,4722,963,4813,985,958,957,965,966,1138,982"},
	},
	["LEVELING\\Darkshore (20-21)"] = {
		{ids="6122", cond_if=[[Druid]]},
		{ids="952", cond_if=[[haveq(952) or completedq(952)]]},
		{ids="5321", cond_if=[[readyq(5321) or completedq(5321)]]},
		{ids="3765,2098,4763,947,2139,986,948,729,944,949,993,1003,950"},
	},
	["LEVELING\\Desolace (35-37)"] = {
		{ids="1453,1458,1437,1454,1455,1465,1438,1439,5561,1382,1387,1440,5501,5741,6161,6027,1384,1370,1456,1459,1112,1114,1183,1186"},
	},
	["LEVELING\\Desolace (40-41)"] = {
		{ids="1373,1374", cond_if=[[not hardcore()]]},
		{ids="1052,1053,1050", cond_if=[[guideflag("SMflag")]]},
		{ids="6134,1117,1187,261,1466"},
	},
	["LEVELING\\Druid Class Quests"] = {
		{ids="5923,5921,5929,5931,6001,6121,6122,6123,6124,6125,26,29,272,5061,9063,9052,9051,9053", cond_if=[[NightElf Druid]]},
	},
	["LEVELING\\Duskwood & Redridge Mountains (25-27)"] = {
		{ids="272,5061", cond_if=[[Druid]]},
		{ids="2360,2359,2607,2608", cond_if=[[Rogue]]},
		{ids="389", cond=[[guideflag("Stockflag")]]},
		{ids="387,391,388,386,377", cond_if=[[guideflag("Stockflag")]]},
		{ids="1650,1651,1652", cond_if=[[Paladin]]},
		{ids="66,174,175,163,164,165,226,67,5,93,56,68,101,148,177,149,154,95,157,230,69,70,72,34,20,127,150,262,265,158,266,240,453,268,323,156,57,94,219,126,91,180,128,269,2923"},
	},
	["LEVELING\\Duskwood & Stranglethorn Vale (30-32)"] = {
		{ids="335", cond_if=[[Mage]]},
		{ids="337", cond_if=[[haveq(337) or completedq(337)]]},
		{ids="335", cond_if=[[not Mage]]},
		{ids="293,322,1274,1241,1242,1243,173,74,75,159,133,134,325,78,58,79,80,225,160,251,401,252,227,97,221,181,1244,98,583,185,190,215,222,223,1245,1246,1447,1247,336,337,1301,1248,1249,1250"},
	},
	["LEVELING\\Dustwallow Marsh & Thousand Needles (33-34)"] = {
		{ids="1718,1719", cond_if=[[Warrior]]},
		{ids="1324", cond_if=[[not hardcore()]]},
		{ids="1798", cond_if=[[Warlock]]},
		{ids="1302,1264,1282,1265,1265,1218,1266,1100,1059,1179,1110,1104,1105,1176,1175,1135,1219,1220,1252,1253,1284,1259,1285,1319,1320,1178,1111,1039"},
	},
	["LEVELING\\Dustwallow Marsh (40-40)"] = {
		{ids="1661", cond_if=[[Paladin]]},
		{ids="1203", cond_if=[[itemcount(3853) > 0]]},
		{ids="4490", cond_if=[[Warlock]]},
		{ids="700,1260,1324,1206,1177,1286,1204,1222,1287"},
	},
	["LEVELING\\Dwarf & Gnome Starter (1-13)"] = {
		{ids="3112", cond_if=[[Gnome Warrior]]},
		{ids="3109", cond_if=[[Dwarf Rogue]]},
		{ids="3107,2999,1646,1647,1648,1778,1779,1783,1784,1785", cond_if=[[Dwarf Paladin]]},
		{ids="1715,1688", cond=[[Gnome Warlock]]},
		{ids="3115,1599,1689", cond_if=[[Gnome Warlock]]},
		{ids="3108", cond_if=[[Dwarf Hunter]]},
		{ids="5625", cond_if=[[Priest]]},
		{ids="1638,1639,1640,1665", cond_if=[[Warrior]]},
		{ids="3110,5637", cond_if=[[Dwarf Priest]]},
		{ids="3106", cond_if=[[Dwarf Warrior]]},
		{ids="3114", cond_if=[[Gnome Mage]]},
		{ids="6064,6084,6085,6086", cond_if=[[Hunter]]},
		{ids="3113", cond_if=[[Gnome Rogue]]},
		{ids="6387,6391,6388,6392", cond_if=[[Dwarf or Gnome]]},
		{ids="179,233,183,234,3364,170,3365,182,218,3361,282,420,2160,400,5541,384,317,313,312,318,310,311,319,315,287,412,320,433,432,419,417,413,414,1339,291,6661,6662,1338,40,35,37,45,5545,52,71,83,244,353,416,418,224,267,39"},
	},
	["LEVELING\\Feralas & Azshara (52-53)"] = {
		{ids="7735", cond_if=[[haveq(7735) or completedq(7735)]]},
		{ids="2943,7003,7721,2879,2844,2845,4142,2942,7733,5158,3601,5534,3449"},
	},
	["LEVELING\\Feralas & Tanaris (44-48)"] = {
		{ids="3520,3527,2768,2865,3042", cond_if=[[guideflag("ZFflag")]]},
		{ids="4124,2866,2867,3130,2869,4125,4127,4129,4130,2870,2871,2766,2969,2970,4131,4135,2821,2982,4265,4266,3022,2939,2940,4267,2972,4281,2941,992,82"},
	},
	["LEVELING\\Hillsbrad Foothills & Arathi Highlands (32-33)"] = {
		{ids="565", cond_if=[[haveq(565) or completedq(565)]]},
		{ids="538,555,536,559,560,561,562,510,505,511,564,690,659,681,514,689,700"},
	},
	["LEVELING\\Human Starter (1-13)"] = {
		{ids="3101,1641,1642,1643,1644", cond_if=[[Human Paladin]]},
		{ids="3103,5623,5624,5635", cond_if=[[Human Priest]]},
		{ids="3904", cond_if=[[haveq(3904) or completedq(3904)]]},
		{ids="1598,3105,1688,1689", cond_if=[[Human Warlock]]},
		{ids="3104", cond_if=[[Human Mage]]},
		{ids="3102,2205", cond_if=[[Rogue]]},
		{ids="1685", cond=[[Human Warlock]]},
		{ids="6181,6281,6261,6285", cond_if=[[Human]]},
		{ids="3905", cond_if=[[haveq(3905) or completedq(3905)]]},
		{ids="184", cond_if=[[haveq(184) or completedq(184)]]},
		{ids="3100,1638,1639,1640,1665", cond_if=[[Human Warrior]]},
		{ids="783,5261,33,7,15,18,3903,6,21,54,2158,85,106,86,111,84,87,47,40,62,60,107,35,37,45,5545,52,71,83,112,39,76,114,239,11,36,109,61,1097,6661,312,412,287,433,432,419,417,353,1339,416,418,224,267,1338"},
	},
	["LEVELING\\Hunter Class Quests"] = {
		{ids="6063,6101,6102,6103", cond_if=[[NightElf Hunter]]},
		{ids="6064,6084,6085,6086", cond_if=[[Dwarf Hunter]]},
		{ids="8151,8153,8231,8232,7632,7636,7635", cond_if=[[Hunter]]},
	},
	["LEVELING\\Loch Modan (18-19)"] = {
		{ids="307,250,199,385,436,297,298,301"},
		{ids="353", cond_if=[[NightElf]]},
	},
	["LEVELING\\Mage Class Quests"] = {
		{ids="1860,1861,1919,1920,1921,1939,1938,1940,1947,1949,1950,1948,1951,1952,1953,1954,1955,1956,1957,2861,2846,7463", cond_if=[[Mage]]},
	},
	["LEVELING\\Night Elf Starter (1-13)"] = {
		{ids="3117,6071,6063,6101,6102,6103", cond_if=[[NightElf Hunter]]},
		{ids="1684,1683,1638,1639,1640,1665", cond_if=[[Warrior]]},
		{ids="2178", cond_if=[[skill("Cooking") >= 10]]},
		{ids="3118,2241", cond_if=[[NightElf Rogue]]},
		{ids="6001", cond_if=[[Druid]]},
		{ids="3119,5629", cond_if=[[NightElf Priest]]},
		{ids="2242", cond_if=[[Rogue]]},
		{ids="6344,6341,6342,6343", cond_if=[[NightElf]]},
		{ids="5622,5621", cond_if=[[Priest]]},
		{ids="3120,5921,5929,5931", cond_if=[[NightElf Druid]]},
		{ids="3116", cond_if=[[NightElf Warrior]]},
		{ids="456,458,4495,916,457,459,3519,917,920,3521,3522,921,2159,928,997,918,919,475,488,476,2438,929,4161,489,932,2459,933,938,937,922,940,7383,931,930,487,923,935,2518,2520,983,3524,4681,2118,984,4761,954,955,956,433,432,419,417,1339,6661,6662,1338"},
	},
	["LEVELING\\Paladin Class Quests"] = {
		{ids="1641,1642,1643,1644,1780,1781,1786,1787,1788", cond_if=[[Human Paladin]]},
		{ids="1649,1650,1651,1652,1653,1655,1654,1806,1661,8415,8414,8416,8418,7638,7637,7639,7640,7641,7642,7648,7645,7643,7644,7646,7647", cond_if=[[Paladin]]},
		{ids="2997,1646,1647,1648,1778,1779,1783,1784,1785", cond_if=[[Dwarf Paladin]]},
	},
	["LEVELING\\Priest Class Quests"] = {
		{ids="5637,5641", cond_if=[[Dwarf Priest]]},
		{ids="5637,5676", cond_if=[[Human Priest]]},
		{ids="5629,5672", cond_if=[[NightElf Priest]]},
	},
	["LEVELING\\Redridge & Westfall (19-20)"] = {
		{ids="1649", cond_if=[[Paladin]]},
		{ids="2281,2282", cond_if=[[Rogue]]},
		{ids="244", cond_if=[[NightElf]]},
		{ids="166,214,373,2040,167,168", cond_if=[[guideflag("DMflag")]]},
		{ids="65,3741,132,120,135,141,103,104,142,155,129,246,118,125,119,122,121,92,130,131,124,89"},
	},
	["LEVELING\\Rogue Class Quests"] = {
		{ids="2218,2238,2239,2360,2359,2607,2608,8233,8234,8235,8236", cond_if=[[Rogue]]},
	},
	["LEVELING\\Scepter of the Shifting Sands"] = {
		{ids="8286,8288,8301,8302,8303,8305,8519,8555,8575,8576,8599,8597,8598,8584,8585,8606,8577,8733,8734,8735,8736,8586,8578,8587,8620,8741,8730,8728,8729,8743"},
	},
	["LEVELING\\Scourge Invasion"] = {
		{ids="9154,9247,9153,9260,9261,9262,9299,9295,9301,9300,9302,9304"},
	},
	["LEVELING\\Searing Gorge (50-51)"] = {
		{ids="3441,3442,3443,3452,3453,3454,3462,4451,4449,3367,3463,3481,7723,7724,7727,7728,7729,3181"},
	},
	["LEVELING\\Season of Discovery Events\\Blackrock Eruption"] = {
		{ids="84349,84355,84351,84348,84372,84356,84359,84350,84360"},
	},
	["LEVELING\\Silithus (59-60)"] = {
		{ids="1124,8275,1125,8277,8280,8284,8285,8279,8281,8278,8287,8304,8318,5163,5527"},
	},
	["LEVELING\\Stonetalon Mountains & Ashenvale (29-30)"] = {
		{ids="2923,2927,2926,2924,2922,2930,2929,2928", cond_if=[[guideflag("Gnomerflag")]]},
		{ids="2948", cond_if=[[(haveq(2948) or completedq(2948)) and guideflag("Gnomerflag")]]},
		{ids="1046", cond_if=[[haveq(1046) or completedq(1046)]]},
		{ids="2945", cond_if=[[(haveq(2945) or completedq(2945)) and guideflag("Gnomerflag")]]},
		{ids="2947", cond_if=[[(haveq(2947) or completedq(2947)) and guideflag("Gnomerflag")]]},
		{ids="1057,1024,1021,4581,1022,1031,1026,1011,1027,1028,1055,1035,1029,1030,1045,1032,1140,1037,1038,637,683,686"},
	},
	["LEVELING\\Stranglethorn Vale (34-35)"] = {
		{ids="1791", cond_if=[[Warrior]]},
		{ids="1758", cond_if=[[Warlock]]},
		{ids="1180,1040,1181,616,198,5762,200,203,204,198,186,194,187,191,605,201,210,213,578,1182,575,1041,1042,1043,563"},
	},
	["LEVELING\\Stranglethorn Vale (37-38)"] = {
		{ids="627", cond_if=[[haveq(627) or completedq(627)]]},
		{ids="1115,198,622,328,195,188,192,207,198,574,329,330,331,189,601,577"},
	},
	["LEVELING\\Stranglethorn Vale (42-43)"] = {
		{ids="339,340,341,342", cond_if=[[haveq(339) or completedq(339)]]},
		{ids="338", cond_if=[[readyq(338) or completedq(338)]]},
		{ids="669,603,1118,595,606,597,607,610,599,205,193,196,600,621,209,611,617,609,628,576,604,587"},
	},
	["LEVELING\\Stranglethorn Vale (50-50)"] = {
		{ids="2874,580,1122,594,197,208,624,608,625,1469"},
	},
	["LEVELING\\Swamp of Sorrows (38-39)"] = {
		{ids="1363", cond_if=[[Mage]]},
		{ids="1393", cond_if=[[not hardcore()]]},
		{ids="1363,1392,1396,1389,1421,1116,1448,1457"},
	},
	["LEVELING\\Swamp of Sorrows (43-43)"] = {
		{ids="1477,1398,1364,1425,1395,623,1258"},
	},
	["LEVELING\\Tanaris (43-44)"] = {
		{ids="2864,1188,1119,1120,1137,1189,1190,1194,2872,1690,1707"},
	},
	["LEVELING\\Tanaris (49-49)"] = {
		{ids="351", cond_if=[[haveq(351) or completedq(351)]]},
		{ids="2876", cond_if=[[haveq(2876) or completedq(2876)]]},
		{ids="3445,2875,8366,2873,8365,3520,2781,1691,10,110,113"},
	},
	["LEVELING\\The Hinterlands (48-49)"] = {
		{ids="485", cond_if=[[haveq(485) or completedq(485)]]},
		{ids="1452,2880,2988"},
	},
	["LEVELING\\Un'Goro Crater (49-50)"] = {
		{ids="7044,7046,7067,7028,7041,7065", cond_if=[[guideflag("Maraflag")]]},
		{ids="3844,4290,4291,3845,3884,4284,4141,2605,5863,3362,2606,3161"},
	},
	["LEVELING\\Un'Goro Crater (53-54)"] = {
		{ids="4244", cond_if=[[haveq(4244) or completedq(4244)]]},
		{ids="4245", cond_if=[[haveq(4245) or completedq(4245)]]},
		{ids="2641,4493,2661,2662,3444,4289,4292,974,4492,4491,4501,3882,4285,4287,4288,4321,3883,3881,4503,4243,4301,4496,4504,4502,1047,6761,3781,978"},
	},
	["LEVELING\\Warlock Class Quests"] = {
		{ids="1685,1688", cond=[[Human Warlock]]},
		{ids="1598,1689", cond_if=[[Human Warlock]]},
		{ids="1717,1716,1738,1739,1798,1758,1802,1804,1471,4487,4488,4490,7601,8420,8421,7602,8422,7603,7562,7563,7564,7626,7627,7628,7630,7623,7624,7625,7629,7631", cond_if=[[Warlock]]},
		{ids="1599,1715,1688,1689", cond_if=[[Gnome Warlock]]},
	},
	["LEVELING\\Warrior Class Quests"] = {
		{ids="1718,1719,1791,1712,1713,8417,8423,8424,8425", cond_if=[[Warrior]]},
		{ids="1638,1639,1640,1665", cond_if=[[Human Warrior]]},
		{ids="1679,1678", cond_if=[[(Dwarf Warrior) or (Gnome Warrior)]]},
		{ids="1684,1683", cond_if=[[NightElf Warrior]]},
	},
	["LEVELING\\Western & Eastern Plaguelands (57-58)"] = {
		{ids="3701,7261,6028,6184,5219,5050,5051,5097,5533,5220,5222,4984,5142,5149,6030,5241,5245,5281,6164,5542,5543,5544,5742,5223,6185,5903,5152,5153,5154,4971,4972,5537,5210,5211,6021,5225,4985,5904,6004,6023,5181,6389,5226,6186"},
	},
	["LEVELING\\Western Plaguelands (51-52)"] = {
		{ids="5092,5215,5216,5021,5217"},
	},
	["LEVELING\\Westfall (13-15)"] = {
		{ids="184,36,109", cond_if=[[Dwarf or Gnome or NightElf]]},
		{ids="22", cond_if=[[readyq(22) or completedq(22)]]},
		{ids="64,151,9,38,22,12,102,153"},
	},
	["LEVELING\\Wetlands (24-25)"] = {
		{ids="1073", cond_if=[[haveq(1073) or completedq(1073)]]},
		{ids="1738,1739", cond_if=[[Warlock]]},
		{ids="943", cond_if=[[haveq(943) or completedq(943)]]},
		{ids="968", cond_if=[[haveq(968) or completedq(968)]]},
		{ids="942", cond_if=[[haveq(942) or completedq(942)]]},
		{ids="971", cond_if=[[guideflag("BFDflag")]]},
		{ids="288,305,294,463,276,470,306,484,469,279,1072,1075"},
	},
	["LEVELING\\Wetlands (27-29)"] = {
		{ids="270,281,284,285,295,296,299,277,289,286,471,464,290,465,275,472,631,632,633,634,292,321,324"},
	},
	["LEVELING\\Winterspring & Felwood (54-56)"] = {
		{ids="8470,8471", cond_if=[[level < 56.10]]},
		{ids="3912", cond_if=[[not hardcore()]]},
		{ids="3912", cond_if=[[hardcore()]]},
		{ids="5159,4441,4442,5202,8461,8465,3909,980,5082,5083,5084,5085,3913,3914,3941,5165,3942,5086,5250,5244,4861,4863,979,4864,4842,5087,4901,4902"},
	},
	["LEVELING\\Winterspring (58-59)"] = {
		{ids="8464", cond_if=[[not zone("Winterspring")]]},
		{ids="8464", cond_if=[[zone("Winterspring")]]},
		{ids="7066", cond_if=[[guideflag("Maraflag")]]},
		{ids="4808,3783,977,4809,6762,4084,4986,4005,3961"},
	},
	["PROFESSIONS\\Blacksmithing\\Blacksmithing (1-300)"] = {
		{ids="7655,7654"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Armorsmith\\Armorsmith Questline"] = {
		{ids="2758,2759,2760,2761,2762,2763,2765,2764,2771,2772,2773,3321,5283"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Axesmith Questline"] = {
		{ids="5306"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Hammersmith Questline"] = {
		{ids="5305"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Swordsmith Questline"] = {
		{ids="5307"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Weaponsmith Questline"] = {
		{ids="5284"},
	},
	["PROFESSIONS\\Cooking\\Cooking (1-300)"] = {
		{ids="6612,6610"},
	},
	["PROFESSIONS\\Cooking\\Cooking + Fishing (1-300)"] = {
		{ids="6609,6607,6610"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Gnomish Engineering\\Gnomish Engineering Questline"] = {
		{ids="3632,3640,3641"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineering Questline"] = {
		{ids="4181,3638,3639"},
	},
	["PROFESSIONS\\First Aid\\First Aid (1-300)"] = {
		{ids="6624"},
	},
	["PROFESSIONS\\Fishing\\Fishing (1-300)"] = {
		{ids="6609,6607"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Dragonscale Leatherworking\\Dragonscale Leatherworking Questline"] = {
		{ids="5141"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Elemental Leatherworking\\Elemental Leatherworking Questline"] = {
		{ids="5144"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Tribal Leatherworking\\Tribal Leatherworking Questline"] = {
		{ids="2847,2848,2849,2850,2851,2852,2853,5143"},
	},
	["PROFESSIONS\\Lockpicking\\Lockpicking (1-300)"] = {
		{ids="2281,2282"},
	},
	["REPUTATIONS\\Reputations\\Bloodsail Buccaneers"] = {
		{ids="1036,4621"},
	},
	["REPUTATIONS\\Reputations\\Brood of Nozdormu"] = {
		{ids="8579", cond_if=[[not completedq(8579)]]},
	},
	["REPUTATIONS\\Reputations\\Cenarion Circle"] = {
		{ids="8318"},
	},
	["REPUTATIONS\\Reputations\\Gelkis & Magram Centaur Clans"] = {
		{ids="1368,1367", cond_if=[[Horde]]},
		{ids="1382,1385", cond_if=[[Alliance]]},
	},
	["REPUTATIONS\\Reputations\\Steamwheedle Cartel"] = {
		{ids="7725", cond_if=[[not rep('Steamwheedle Cartel') == Exalted]]},
		{ids="7003"},
	},
	["REPUTATIONS\\Reputations\\Thorium Brotherhood"] = {
		{ids="7723,7724,7727,7728,7729,7722"},
	},
	["REPUTATIONS\\Reputations\\Timbermaw Hold"] = {
		{ids="8470", cond_if=[[haveq(8470) or completedq(8470)]]},
		{ids="8460,8462,8461,8465,8464"},
	},
	["REPUTATIONS\\Reputations\\Wintersaber Trainers"] = {
		{ids="5201,5981", cond_if=[[rep('Wintersaber Trainers') < Exalted]]},
		{ids="8464", cond_if=[[haveq(8464) or completedq(8464)]]},
		{ids="4970", cond_if=[[haveq(4970) or completedq(4970)]]},
	},
}
GQ.Quest_Cache_Accept_Horde = {
	["DUNGEONS\\Blackfathom Deeps Quests"] = {
		{ids="6563,6921,6564,6565,6561,6922"},
	},
	["DUNGEONS\\Blackrock Depths Quests"] = {
		{ids="4324,4133,4134,3906,4081,4061,3441,3442,3443,3452,3453,3454,3462,3463,3481,4123,4136,4022,4024,4062,4063,3801,3802,4201,3907,4082,3981,3982,4001,4002,4003,4004"},
	},
	["DUNGEONS\\Dire Maul East Quests"] = {
		{ids="5527,5526,7489,7441"},
	},
	["DUNGEONS\\Dire Maul North Quests"] = {
		{ids="7481,5518,5528,7703"},
	},
	["DUNGEONS\\Dire Maul West Quests"] = {
		{ids="7461,7462"},
	},
	["DUNGEONS\\Gnomeregan Quests"] = {
		{ids="2841,2842,2843"},
	},
	["DUNGEONS\\Lower Blackrock Spire Quests"] = {
		{ids="3520,3527,4787,3528,5065,4788,4866,4729,4862,4903,4981,4724,4867,4982,4983,4742"},
	},
	["DUNGEONS\\Maraudon Quests"] = {
		{ids="7068,7029,7064,7028,7067,7044,7046,7066"},
	},
	["DUNGEONS\\Ragefire Chasm Quests"] = {
		{ids="5723,5722,5725,5726,5727,5728,5761,5724,5729,5730"},
	},
	["DUNGEONS\\Raid Attunements\\Blackwing Lair Attunement"] = {
		{ids="7761"},
	},
	["DUNGEONS\\Raid Attunements\\Molten Core Attunement"] = {
		{ids="7848"},
	},
	["DUNGEONS\\Raid Attunements\\Naxxramas Attunement"] = {
		{ids="9123", cond_if=[[rep("Argent Dawn") == Exalted or completedq(9123)]]},
		{ids="9122", cond_if=[[rep("Argent Dawn") == Revered or completedq(9122)]]},
		{ids="9121", cond_if=[[rep("Argent Dawn") == Honored or completedq(9121)]]},
	},
	["DUNGEONS\\Raid Attunements\\Onyxia's Lair Attunement"] = {
		{ids="4903,4941,4974,6566,6567,6568,6569,6570,6582,6583,6584,6585,6601,6602"},
	},
	["DUNGEONS\\Razorfen Downs Quests"] = {
		{ids="6522,6521,3341,6626,3523,3525"},
	},
	["DUNGEONS\\Razorfen Kraul Quests"] = {
		{ids="1109,1221,1102,6522,1144"},
	},
	["DUNGEONS\\Scarlet Monastery Armory Quests"] = {
		{ids="1048"},
	},
	["DUNGEONS\\Scarlet Monastery Cathedral Quests"] = {
		{ids="1048"},
	},
	["DUNGEONS\\Scarlet Monastery Graveyard Quests"] = {
		{ids="1109,1113,1051"},
	},
	["DUNGEONS\\Scarlet Monastery Library Quests"] = {
		{ids="1149,1150,1151,1152,1154,6627,1159,1160,1048,6628,1394"},
		{ids="1049", cond=[[Orc]]},
	},
	["DUNGEONS\\Scholomance Quests"] = {
		{ids="5094,4726,4808,4809,4810,4907,4734,4735,5522,5531,5529,4771,5096,5098,838,964,5514,5802,5803,5511,5341,5382,5515,5582,5384,5461,5462,5463,5464,5465,5466"},
	},
	["DUNGEONS\\Shadowfang Keep Quests"] = {
		{ids="1013,1014,1098"},
	},
	["DUNGEONS\\Stratholme - Live Side Quests"] = {
		{ids="5214,5251,5281,5282,5542,5543,5544,5742,5781,5845,5846,5848,5122,5262"},
	},
	["DUNGEONS\\Stratholme - Undead Side Quests"] = {
		{ids="5382,5515,5384,5461,5462,5463,5251,5262,5263,6022,6133,6042,6135,6136,6163,5212,5243,5122,5125,5464,5213"},
	},
	["DUNGEONS\\Temple of Atal'Hakkar Quests"] = {
		{ids="3380,3444,3446,3520,3527,4787,1424,1429,1444,1446,3528,1445,4145,4147,4146,3447,3373"},
	},
	["DUNGEONS\\Tier 0.5 Dungeon Gear Questline"] = {
		{ids="8915,8939,9018,9014", cond_if=[[Mage]]},
		{ids="8920,8944,9022,9013", cond_if=[[Warrior]]},
		{ids="8918,8942,8957,9011", cond_if=[[Shaman]]},
		{ids="8914,8938,9017,9008", cond_if=[[Hunter]]},
		{ids="8913,8927,9016,9007", cond_if=[[Druid]]},
		{ids="8917,8941,9020,9010", cond_if=[[Rogue]]},
		{ids="8916,8940,9019,9009", cond_if=[[Priest]]},
		{ids="8919,8943,9021,9012", cond_if=[[Warlock]]},
		{ids="8923,8921,8924,8925,8928,8978,8930,8945,8946,8947,8948,8949,8950,9015,9032,8961,8964,8965,8962,8963,8968,8969,8966,8967,8970,8985,8986,8988,8987,8991,8992,8989,8990,8994,8995,8996,8998"},
	},
	["DUNGEONS\\Uldaman Quests"] = {
		{ids="2278,2280", cond_if=[[level >=40]]},
		{ids="2342,2418,709,2258,2202,2283,2284,2318,2338,2339,2340,2341"},
	},
	["DUNGEONS\\Upper Blackrock Spire Quests"] = {
		{ids="4769,4768,4903,4726,4808,4809,4810,4907,4734,6804,6805,6821,4941,5160,5047,4941,4974,4735,5161,5162,5164,6566,6567,6568,6569,6570,6582,6583,6584,6585,6601,6602"},
	},
	["DUNGEONS\\Wailing Caverns Quests"] = {
		{ids="870,877,880,1489,1490,914,962,865,1491,959,1486,1487,6981,3366,3369"},
		{ids="886", cond=[[of not haveq(870) or completedq(870)]]},
	},
	["DUNGEONS\\Zul'Farrak Quests"] = {
		{ids="2933,2934,2935,2936,2846,2770,3520,3527,2768,2865,3042"},
	},
	["EVENTS\\Children's Week\\Children's Week Main Questline"] = {
		{ids="172,1800,910,911,915,925,5502"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Chronos Turn-Ins (Elwynn Forest)"] = {
		{ids="7881,7882,7883,7884,7885,7941"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Kerri Hicks Turn-Ins (Elwynn Forest)"] = {
		{ids="7889,7890,7891,7892,7893,7939"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Rinling Turn-Ins (Elwynn Forest)"] = {
		{ids="7894,7895,7896,7897,7898,7942"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Sayge's Fortunes (Elwynn Forest)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Spawn of Jubjub (Elwynn Forest)"] = {
		{ids="7946"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Yebb Neblegear Turn-Ins (Elwynn Forest)"] = {
		{ids="7899,7900,7901,7902,8222,8223"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Chronos Turn-Ins (Mulgore)"] = {
		{ids="7881,7882,7883,7884,7885,7941"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Kerri Hicks Turn-Ins (Mulgore)"] = {
		{ids="7889,7890,7891,7892,7893,7939"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Rinling Turn-Ins (Mulgore)"] = {
		{ids="7894,7895,7896,7897,7898,7942"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Sayge's Fortunes (Mulgore)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Spawn of Jubjub (Mulgore)"] = {
		{ids="7946"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Yebb Neblegear Turn-Ins (Mulgore)"] = {
		{ids="7899,7900,7901,7902,8222,8223"},
	},
	["EVENTS\\Feast of Winter Veil\\Feast of Winter Veil Quest"] = {
		{ids="6964,7061,6961,6962,6963,6983,6984,8746"},
	},
	["EVENTS\\Hallow's End\\Hallow's End Quests"] = {
		{ids="8312,8359,8358,8360,8354,1657"},
	},
	["EVENTS\\Harvest Festival\\Harvest Festival Quest"] = {
		{ids="8150"},
	},
	["EVENTS\\Love is in the Air\\Gift Giving"] = {
		{ids="8981,8981,8981"},
	},
	["EVENTS\\Love is in the Air\\Love is in the Air Quests"] = {
		{ids="8904,8979,8980,8982,8983,8984,9029"},
	},
	["EVENTS\\Lunar Festival\\Lunar Festival Main Questline"] = {
		{ids="8873,8867,8883,8864,8865,8863,8862"},
	},
	["EVENTS\\Lunar Festival\\Lunar Festival Optimized Elders Path"] = {
		{ids="8714,8722,8652,8648,8645,8650,8688,8643,8642,8866,8653,8651,8683,8636,8649,8646,8675,8647,8716,8674,8680,8717,8686,8673,8678,8679,8685,8719,8654,8681,8671,8684,8724,8682,8677,8670,8720,8672,8726,8723,8725,8721,8718,8715,8676,8635,8713,8619,8644,8727"},
	},
	["EVENTS\\Midsummer Fire Festival\\Midsummer Fire Festival Quests"] = {
		{ids="9339", cond_if=[[completedallq(9332,9330,9331)]]},
		{ids="9319,9332,9330,9331", cond_if=[[level >= 50]]},
		{ids="9368,9389,9388,9323,9322"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Cenarion Battlegear"] = {
		{ids="8800,8548,8572,8573,8574"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Cloak Quest"] = {
		{ids="8557", cond=[[Warrior]]},
		{ids="8695", cond=[[Paladin]]},
		{ids="8690", cond=[[Shaman]]},
		{ids="8693", cond=[[Rogue]]},
		{ids="8691", cond=[[Mage]]},
		{ids="8692", cond=[[Druid]]},
		{ids="8689", cond=[[Priest]]},
		{ids="8696", cond=[[Hunter]]},
		{ids="8694", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Ring Quest"] = {
		{ids="8556", cond=[[Warrior]]},
		{ids="8703", cond=[[Paladin]]},
		{ids="8698", cond=[[Shaman]]},
		{ids="8701", cond=[[Rogue]]},
		{ids="8699", cond=[[Mage]]},
		{ids="8700", cond=[[Druid]]},
		{ids="8697", cond=[[Priest]]},
		{ids="8704", cond=[[Hunter]]},
		{ids="8702", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Weapon Quest"] = {
		{ids="8558", cond=[[Warrior]]},
		{ids="8711", cond=[[Paladin]]},
		{ids="8706", cond=[[Shaman]]},
		{ids="8709", cond=[[Rogue]]},
		{ids="8707", cond=[[Mage]]},
		{ids="8708", cond=[[Druid]]},
		{ids="8705", cond=[[Priest]]},
		{ids="8712", cond=[[Hunter]]},
		{ids="8710", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Signet Ring of the Bronze Dragonflight"] = {
		{ids="8753,8754,8755,8756", cond_if=[[completedq(8752)]]},
		{ids="8758,8759,8760,8761", cond_if=[[completedq(8757)]]},
		{ids="8766", cond_if=[[completedq(8756)]]},
		{ids="8764", cond_if=[[completedq(8751)]]},
		{ids="8765", cond_if=[[completedq(8761)]]},
		{ids="8748,8749,8750,8751", cond_if=[[completedq(8747)]]},
		{ids="8757,8747,8752"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Boots Quest"] = {
		{ids="8559", cond=[[Warrior]]},
		{ids="8655", cond=[[Paladin]]},
		{ids="8621", cond=[[Shaman]]},
		{ids="8637", cond=[[Rogue]]},
		{ids="8634", cond=[[Mage]]},
		{ids="8665", cond=[[Druid]]},
		{ids="8596", cond=[[Priest]]},
		{ids="8626", cond=[[Hunter]]},
		{ids="8660", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Chest Quest"] = {
		{ids="8562,8562", cond=[[Warrior]]},
		{ids="8627,8627", cond=[[Paladin]]},
		{ids="8622,8622", cond=[[Shaman]]},
		{ids="8638,8638", cond=[[Rogue]]},
		{ids="8633,8633", cond=[[Mage]]},
		{ids="8666,8666", cond=[[Druid]]},
		{ids="8603,8603", cond=[[Priest]]},
		{ids="8656,8656", cond=[[Hunter]]},
		{ids="8661,8661", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Helm Quest"] = {
		{ids="8561", cond=[[Warrior]]},
		{ids="8628", cond=[[Paladin]]},
		{ids="8623", cond=[[Shaman]]},
		{ids="8639", cond=[[Rogue]]},
		{ids="8632", cond=[[Mage]]},
		{ids="8667", cond=[[Druid]]},
		{ids="8592", cond=[[Priest]]},
		{ids="8657", cond=[[Hunter]]},
		{ids="8662", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Legs Quest"] = {
		{ids="8560", cond=[[Warrior]]},
		{ids="8629", cond=[[Paladin]]},
		{ids="8624", cond=[[Shaman]]},
		{ids="8640", cond=[[Rogue]]},
		{ids="8631", cond=[[Mage]]},
		{ids="8668", cond=[[Druid]]},
		{ids="8593", cond=[[Priest]]},
		{ids="8658", cond=[[Hunter]]},
		{ids="8663", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Shoulder Quest"] = {
		{ids="8544", cond=[[Warrior]]},
		{ids="8630", cond=[[Paladin]]},
		{ids="8602", cond=[[Shaman]]},
		{ids="8641", cond=[[Rogue]]},
		{ids="8625", cond=[[Mage]]},
		{ids="8669", cond=[[Druid]]},
		{ids="8594", cond=[[Priest]]},
		{ids="8659", cond=[[Hunter]]},
		{ids="8664", cond=[[Warlock]]},
	},
	["LEVELING\\Alterac Mountains & Arathi Highlands (38-39)"] = {
		{ids="1713,1792", cond_if=[[Warrior]]},
		{ids="545,557,566,503,506,507,508,678,701,651,702,847,663,662,664,665,666,668,669"},
	},
	["LEVELING\\Arathi Highlands (32-33)"] = {
		{ids="642,677,655,672,671,674,675,513"},
	},
	["LEVELING\\Ashenvale (21-22)"] = {
		{ids="2460,2458,2478,2479", cond_if=[[Rogue]]},
		{ids="1515,1512,1513", cond_if=[[Warlock]]},
		{ids="216,6442,6462,1064,1065"},
	},
	["LEVELING\\Ashenvale (26-28)"] = {
		{ids="6921,6563,6564,6561,6922", cond_if=[[guideflag("BFDflag")]]},
		{ids="24,23,2", cond_if=[[completedq(6383)]]},
		{ids="6504", cond_if=[[itemcount(16645) > 0 and itemcount(16646) > 0 and itemcount(16647) > 0 and itemcount(16648) > 0 and itemcount(16649) > 0 and itemcount(16650) > 0 and itemcount(16651) > 0 and itemcount(16652) > 0 and itemcount(16653) > 0 and itemcount(16654) > 0 and itemcount(16655) > 0 and itemcount(16656) > 0]]},
		{ids="6541,6503,6383,25,6441,6544,6482,1918,824,6641,247,1196,1131"},
	},
	["LEVELING\\Azshara (54-54)"] = {
		{ids="3505,3542,3601,3506,5534,3507"},
	},
	["LEVELING\\Badlands (39-40)"] = {
		{ids="705", cond_if=[[itemcount(4611) >= 9]]},
		{ids="713", cond_if=[[itemcount(3829) > 0]]},
		{ids="715", cond_if=[[itemcount(929) > 0 and itemcount(3823) > 0]]},
		{ids="714", cond_if=[[haveq(713) or completedq(713)]]},
		{ids="3631", cond_if=[[Warlock]]},
		{ids="703,1108,710,1419,2258,711,1137,1420,1205"},
	},
	["LEVELING\\Blasted Lands (50-51)"] = {
		{ids="3501", cond_if=[[itemcount(10593) > 0]]},
		{ids="2521", cond_if=[[itemcount(8244) > 0]]},
		{ids="2581,2583,2585,2601,2603"},
	},
	["LEVELING\\Burning Steppes & Azshara (51-52)"] = {
		{ids="3421", cond_if=[[haveq(3565)]]},
		{ids="4022", cond_if=[[itemcount(10575) > 0 or (haveq(4022) or completedq(4022))]]},
		{ids="3503", cond_if=[[haveq(3561)]]},
		{ids="4726,4296,4808,3504,4494,5535,5536,3517,3518,3541,3561,3565"},
	},
	["LEVELING\\Cenarion Field Duty Combat Assignments"] = {
		{ids="8773", cond_if=[[itemcount(21248) >= 1 or haveq(8773)]]},
		{ids="8771", cond_if=[[itemcount(21750) >= 1 or haveq(8771)]]},
		{ids="8501", cond_if=[[itemcount(20941) >= 1 or haveq(8501)]]},
		{ids="8777", cond_if=[[itemcount(21256) >= 1 or haveq(8777)]]},
		{ids="8776", cond_if=[[itemcount(21255) >= 1 or haveq(8776)]]},
		{ids="8775", cond_if=[[itemcount(21253) >= 1 or haveq(8775)]]},
		{ids="8774", cond_if=[[itemcount(21252) >= 1 or haveq(8774)]]},
		{ids="8770", cond_if=[[itemcount(21749) >= 1 or haveq(8770)]]},
		{ids="8687", cond_if=[[itemcount(21251) >= 1 or haveq(8687)]]},
		{ids="8502", cond_if=[[itemcount(20942) >= 1 or haveq(8502)]]},
		{ids="8772", cond_if=[[itemcount(21250) >= 1 or haveq(8772)]]},
		{ids="8539", cond_if=[[itemcount(21249) >= 1 or haveq(8539)]]},
		{ids="8731,8732"},
	},
	["LEVELING\\Cenarion Field Duty Logistics Assignments"] = {
		{ids="8807", cond_if=[[itemcount(21382) >= 1 or haveq(8807)]]},
		{ids="8805", cond_if=[[itemcount(21379) >= 1 or haveq(8805)]]},
		{ids="8809", cond_if=[[itemcount(21381) >= 1 or haveq(8809)]]},
		{ids="8808", cond_if=[[itemcount(21384) >= 1 or haveq(8808)]]},
		{ids="8806", cond_if=[[itemcount(21380) >= 1 or haveq(8806)]]},
		{ids="8810", cond_if=[[itemcount(21385) >= 1 or haveq(8810)]]},
		{ids="8829", cond_if=[[itemcount(21514) >= 1 or haveq(8829)]]},
		{ids="8804", cond_if=[[itemcount(21378) >= 1 or haveq(8804)]]},
		{ids="8786", cond_if=[[itemcount(21261) >= 1 or haveq(8786)]]},
		{ids="8787", cond_if=[[itemcount(21264) >= 1 or haveq(8787)]]},
		{ids="8785", cond_if=[[itemcount(21258) >= 1 or haveq(8785)]]},
		{ids="8731,8732"},
	},
	["LEVELING\\Cenarion Field Duty Tactical Assignments"] = {
		{ids="8738", cond_if=[[itemcount(21166) >= 1 or haveq(8738)]]},
		{ids="8536", cond_if=[[itemcount(21751) >= 1 or haveq(8536)]]},
		{ids="8740", cond_if=[[itemcount(20944) >= 1 or haveq(8740)]]},
		{ids="8498", cond_if=[[itemcount(20943) >= 1 or haveq(8498)]]},
		{ids="8739", cond_if=[[itemcount(21167) >= 1 or haveq(8739)]]},
		{ids="8538", cond_if=[[itemcount(20948) >= 1 or haveq(8538)]]},
		{ids="8537", cond_if=[[itemcount(20945) >= 1 or haveq(8537)]]},
		{ids="8535", cond_if=[[itemcount(20947) >= 1 or haveq(8535)]]},
		{ids="8534", cond_if=[[itemcount(21165) >= 1 or haveq(8534)]]},
		{ids="8737", cond_if=[[itemcount(21245) >= 1 or haveq(8737)]]},
		{ids="8731,8732"},
	},
	["LEVELING\\Desolace (34-36)"] = {
		{ids="1480,5741,1433,1434,1435,1481,1365,1368,5501,1482,1366,5561,1370,5381,6143,6142,6027,6161,1484,1436,1373,5763"},
	},
	["LEVELING\\Desolace (41-41)"] = {
		{ids="5581,1374,6134,1488"},
	},
	["LEVELING\\Druid Class Quests"] = {
		{ids="5928,5922,5930,5932,6002", cond_if=[[Tauren Druid]]},
		{ids="6126,6127,6128,6129,6130,27,28,30,31,9063,9052,9051,9053", cond_if=[[Druid]]},
	},
	["LEVELING\\Dustwallow Marsh (37-38)"] = {
		{ids="1202", cond_if=[[not hardcore()]]},
		{ids="1049", cond_if=[[guideflag("SMflag") and not Scourge]]},
		{ids="1048", cond_if=[[guideflag("SMflag")]]},
		{ids="1203", cond_if=[[itemcount(3853) > 0]]},
		{ids="1201,1268,1269,1251,1177,1321,1322,1270,1218,1238,1206,1323,1273,1276,1239,1240,232,238,243"},
	},
	["LEVELING\\Dustwallow Marsh (42-42)"] = {
		{ids="1166,1169,1168,1170,1171,1262,7541,2981"},
	},
	["LEVELING\\Felwood & Winterspring (52-53)"] = {
		{ids="8466", cond_if=[[rep('Timbermaw Hold') < Unfriendly]]},
		{ids="5155,5156,8460,8462,4102,4505,6162,5157,5082,5083,5084,3909,5158,3563"},
	},
	["LEVELING\\Felwood & Winterspring (54-56)"] = {
		{ids="3913", cond_if=[[not hardcore()]]},
		{ids="3913", cond_if=[[hardcore()]]},
		{ids="8470", cond_if=[[level < 56.10]]},
		{ids="8467,8467", cond_if=[[itemcount(21377) >= 5]]},
		{ids="4506,5165,5887,5202,4521,8461,5085,8465,4842,3912,5086,3783,4741,3914,4504,3941,3942,6029,6030,5601,4084,5087,8464,4005,3564,3569,3570,7816"},
	},
	["LEVELING\\Feralas & Un'Goro Crater (49-50)"] = {
		{ids="3062", cond_if=[[not hardcore()]]},
		{ids="7725", cond_if=[[not (readyq(3127) or completedq(3127))]]},
		{ids="7738", cond_if=[[itemcount(18972) == 0 and not (readyq(7734) or completedq(7734))]]},
		{ids="7064,7029,7028,7067,7044,7046,7066", cond_if=[[guideflag("Maraflag")]]},
		{ids="3063,7734,3124,3128,3125,3126,3127,7003,7721,4289,4290,3844,3845,4291,3884,4292,3908,4284,4120,3129,4502"},
	},
	["LEVELING\\Feralas (43-44)"] = {
		{ids="2766", cond_if=[[itemcount(8705) > 0]]},
		{ids="2987,2973,2862,2822,2975,2978,2863,2980,2979,2902,2974,2903,7730,7731,2976,3121,7732,3002,3122"},
	},
	["LEVELING\\Hillsbrad Foothills (22-24)"] = {
		{ids="31", cond_if=[[Druid]]},
		{ids="2480", cond_if=[[Rogue]]},
		{ids="1013,1014,1098", cond_if=[[guideflag("SFKflag")]]},
		{ids="493,494,1066,496,501,527,567,549,498,499,1067,502,528,546,529"},
	},
	["LEVELING\\Hillsbrad Foothills (30-32)"] = {
		{ids="553", cond_if=[[not hardcore()]]},
		{ids="1712", cond_if=[[Warrior]]},
		{ids="100,96", cond_if=[[Shaman]]},
		{ids="7321", cond_if=[[skill("Cooking") > 0]]},
		{ids="1164,509,532,533,552,544,556,539,676"},
	},
	["LEVELING\\Hunter Class Quests"] = {
		{ids="6061,6087,6088,6089", cond_if=[[Tauren Hunter]]},
		{ids="6062,6083,6082,6081", cond_if=[[(Orc Hunter) or (Troll Hunter)]]},
		{ids="8151,8153,8231,8232,7632,7633,7636,7635", cond_if=[[Hunter]]},
	},
	["LEVELING\\Mage Class Quests"] = {
		{ids="1883,1884,1959,1960,1961,1962,1943,1944,1945,1946,1947,1949,1950,1951,1948,1952,1953,1954,1955,1956,1957,1958,2861,2846,7463", cond_if=[[Mage]]},
	},
	["LEVELING\\Orc & Troll Starter (1-13)"] = {
		{ids="3086", cond=[[Troll Mage]]},
		{ids="3065", cond=[[Troll Warrior]]},
		{ids="1516,1517,1518,2983,1524,1525,1526,1527", cond_if=[[Shaman]]},
		{ids="5649,5648,5654", cond_if=[[Priest]]},
		{ids="361", cond_if=[[itemcount(2839) > 0]]},
		{ids="1818,1819,1820", cond_if=[[Warrior]]},
		{ids="3089", cond=[[Orc Shaman]]},
		{ids="3087", cond=[[Orc Hunter]]},
		{ids="1881,1882", cond_if=[[Mage]]},
		{ids="3083", cond=[[Troll Rogue]]},
		{ids="812", cond_if=[[not Hunter]]},
		{ids="813", cond_if=[[haveq(812) and Hunter]]},
		{ids="6062,6083,6082,6081,812", cond_if=[[Hunter]]},
		{ids="806", cond_if=[[Warrior or Shaman]]},
		{ids="1485,1499,1478,1473,1471", cond_if=[[Warlock]]},
		{ids="3085", cond=[[Troll Priest]]},
		{ids="792", cond_if=[[not Warlock]]},
		{ids="3084", cond=[[Troll Shaman]]},
		{ids="2383", cond=[[Orc Warrior]]},
		{ids="3090", cond=[[Orc Warlock]]},
		{ids="3088", cond=[[Orc Rogue]]},
		{ids="813", cond_if=[[haveq(812)]]},
		{ids="3082", cond=[[Troll Hunter]]},
		{ids="4641,788,790,804,789,4402,5441,794,6394,805,2161,786,817,818,808,826,823,784,837,815,791,830,825,831,834,835,816,812,354,362,375,358,398,367,368,355,445,356"},
	},
	["LEVELING\\Priest Class Quests"] = {
		{ids="5658,5644", cond_if=[[Scourge Priest]]},
		{ids="5652,5643", cond_if=[[Troll Priest]]},
		{ids="8254,8255,8256,8257,8916", cond_if=[[Priest]]},
	},
	["LEVELING\\Rogue Class Quests"] = {
		{ids="2460,2458,2478,2479,2480,8233,8234,3503,8235,3421,3503,8236", cond_if=[[Rogue]]},
	},
	["LEVELING\\Scepter of the Shifting Sands"] = {
		{ids="8286,8288,8301,8302,8303,8305,8519,8555,8575,8576,8577,8584,8597,8599,8598,8606,8585,8586,8620,8578,8733,8734,8735,8736,8741,8587,8730,8728,8729,8742,8743,8745"},
	},
	["LEVELING\\Scourge Invasion"] = {
		{ids="9154,9247,9153,9263,9265,9264,9299,9295,9301,9300,9302,9304"},
	},
	["LEVELING\\Searing Gorge (51-51)"] = {
		{ids="3821,4449,3441,3442,7728,7729,7723,7724,7727,3443,4451,3452,3453,3454,3462,3463,3481"},
	},
	["LEVELING\\Season of Discovery Events\\Blackrock Eruption"] = {
		{ids="84349,84355,84351,84348,84372,84356,84360,84359,84350"},
	},
	["LEVELING\\Shaman Class Quests"] = {
		{ids="1516,1517,1518,2983", cond_if=[[(Orc Shaman) or (Troll Shaman)]]},
		{ids="1519,1520,1521,2984", cond_if=[[Tauren Shaman]]},
		{ids="1524,1525,1526,1527,1528,1530,1535,1536,1534,220,63,100,96,1531,8410,8412,8413", cond_if=[[Shaman]]},
	},
	["LEVELING\\Silithus (59-60)"] = {
		{ids="8308", cond_if=[[itemcount(20461) > 0]]},
		{ids="1125,8277,8280,8284,8318,8304,8278,8281,8285,8279,8287"},
	},
	["LEVELING\\Silverpine Forest (13-15)"] = {
		{ids="6321,6323,6322,6324", cond_if=[[Scourge]]},
		{ids="5723,5722,5724", cond_if=[[Tauren and guideflag("RFCflag")]]},
		{ids="1898,1899,1978", cond_if=[[Scourge Rogue]]},
		{ids="5726,5727,5728,5761", cond_if=[[guideflag("RFCflag")]]},
		{ids="435,449,429,421,477,3221,437,1359,430,447,422,425,423,438,439,478,481,482,1358"},
	},
	["LEVELING\\Stonetalon Mountains (25-26)"] = {
		{ids="1087,6301,5881,6282,6393,1096,6381"},
	},
	["LEVELING\\Stranglethorn Vale & Swamp of Sorrows (40-41)"] = {
		{ids="1393", cond_if=[[not hardcore()]]},
		{ids="4490", cond_if=[[Warlock]]},
		{ids="577,600,209,572,584,598,585,628,1116,1261,197,1372,698,1424,1392,1389,1117,2864,1183,2872"},
	},
	["LEVELING\\Stranglethorn Vale & Swamp of Sorrows (50-50)"] = {
		{ids="1173", cond_if=[[not hardcore()]]},
		{ids="624,624,624", cond_if=[[itemcount(4056) > 0]]},
		{ids="208,608,594,2623,625,626,2801"},
	},
	["LEVELING\\Stranglethorn Vale (36-37)"] = {
		{ids="568,581,596,583,194,185,190,186,187,191,195,188,192,582,629,569,570,196,193,638"},
	},
	["LEVELING\\Stranglethorn Vale (44-45)"] = {
		{ids="341", cond_if=[[itemcount(2742) > 0 and itemcount(2744) > 0 and itemcount(2745) > 0 and itemcount(2748) > 0]]},
		{ids="339", cond_if=[[itemcount(2725) > 0 and itemcount(2728) > 0 and itemcount(2730) > 0 and itemcount(2732) > 0]]},
		{ids="342", cond_if=[[itemcount(2749) > 0 and itemcount(2750) > 0 and itemcount(2751) > 0]]},
		{ids="340", cond_if=[[itemcount(2734) > 0 and itemcount(2735) > 0 and itemcount(2738) > 0 and itemcount(2740) > 0]]},
		{ids="586,338,588,589,571,621,606,595,597,607,599,609,587,604,576,617,573,580"},
	},
	["LEVELING\\Swamp of Sorrows (45-46)"] = {
		{ids="2784,2621,2622,1429,699,1422,1426,1427,1428,1119,3123,3380"},
	},
	["LEVELING\\Tanaris & Dustwallow Marsh (46-48)"] = {
		{ids="2750", cond_if=[[itemcount(8646) > 0]]},
		{ids="2749", cond_if=[[itemcount(8645) > 0]]},
		{ids="2846,3527,2768,2865,3042", cond_if=[[guideflag("ZFflag")]]},
		{ids="2748", cond_if=[[itemcount(8644) > 0]]},
		{ids="2876,351", cond_if=[[level < 47]]},
		{ids="2747", cond_if=[[itemcount(8643) > 0]]},
		{ids="1120,1122,1188,3362,992,82,2781,2875,2741,5863,1691,2605,8365,8366,2873,2874,3444,3161,2606,2641,10,864,110,113,32,1172,649,650,4300"},
	},
	["LEVELING\\Tanaris (41-42)"] = {
		{ids="1191", cond_if=[[haveq(1190)]]},
		{ids="1707,379,1690,3520,1118,1186,1190,1187,1194"},
	},
	["LEVELING\\Tanaris (42-43)"] = {
		{ids="654"},
		{ids="992", cond_if=[[not hardcore()]]},
	},
	["LEVELING\\Tauren Starter (1-13)"] = {
		{ids="1818,1819,1820", cond_if=[[Warrior]]},
		{ids="3093", cond=[[Tauren Shaman]]},
		{ids="1524,1525,1526,1527", cond_if=[[Shaman]]},
		{ids="3094", cond=[[Tauren Druid]]},
		{ids="3091", cond=[[Tauren Warrior]]},
		{ids="5928,5922,886,5930,5932,6002", cond_if=[[Druid]]},
		{ids="6061,6087,6088,6089", cond_if=[[Hunter]]},
		{ids="748", cond_if=[[Tauren]]},
		{ids="3092", cond=[[Tauren Hunter]]},
		{ids="813", cond_if=[[haveq(812)]]},
		{ids="1519,1520,1521,2984", cond_if=[[Tauren Shaman]]},
		{ids="747,752,753,750,755,757,780,3376,781,763,1656,766,761,743,745,767,746,771,754,756,772,749,751,758,773,833,775,854,6361,6362,6363,6364,791,815,784,837,830,2161,817,818,808,826,823,816,831,834,835,812,812,445"},
	},
	["LEVELING\\The Barrens & Stonetalon Mountain (15-21)"] = {
		{ids="1507,1508,1509,1510,1511", cond_if=[[Warlock]]},
		{ids="6981,3366", cond_if=[[itemcount(10441) > 0 and guideflag("WCflag")]]},
		{ids="1859", cond_if=[[(Orc or Troll) and Rogue]]},
		{ids="962,914,959,1491,1487,1486", cond_if=[[guideflag("WCflag")]]},
		{ids="6365,6384,6385,6386", cond_if=[[Orc or Troll]]},
		{ids="819", cond_if=[[itemcount(4926) > 0]]},
		{ids="1963,2379,1858,2382,2381", cond_if=[[Rogue]]},
		{ids="3369", cond_if=[[((haveq(6981) or completedq(6981)) or (haveq(3366) or completedq(3366))) and guideflag("WCflag")]]},
		{ids="27,28,30", cond_if=[[Druid]]},
		{ids="5642,5644", cond_if=[[Priest]]},
		{ids="1528,1530,1535,1536", cond_if=[[Shaman]]},
		{ids="840,842,869,844,870,871,848,1492,819,872,5041,867,845,887,894,895,821,890,892,896,888,903,855,850,851,900,901,902,3921,875,877,881,3281,1061,3922,858,863,905,4921,876,1483,865,1069,899,880,3261,852,1062,6548,6629,6523,6461,1093,1094,882,878,883,1095,1060,1489,3301,5052,907,913,874,853,264,1490,868,1063,1068,6401,1058,6562"},
	},
	["LEVELING\\The Barrens (24-25)"] = {
		{ids="1534", cond_if=[[Shaman]]},
		{ids="897", cond_if=[[itemcount(5138) > 0]]},
		{ids="1086,1195,879,893,884,843,885,846,849,6382,906,873"},
	},
	["LEVELING\\The Hinterlands (48-49)"] = {
		{ids="485,485", cond_if=[[itemcount(8704) > 0]]},
		{ids="7843", cond_if=[[not hardcore()]]},
		{ids="2995,2933,77,7839,7840,7815,7828,7829,7830,7841,7844,2742,2782,7842,2934,81,1444,8273,3568,2661,2662"},
	},
	["LEVELING\\Thousand Needles (28-30)"] = {
		{ids="220,63,1531", cond_if=[[Shaman]]},
		{ids="1718,1719,1791", cond_if=[[Warrior]]},
		{ids="1153,4542,4767,4821,4841,1197,1149,4865,4770,5062,4881,4881,4966,1136,5088,5064,5147,4904,5151,1111,1145,1112,1431,1146,1432"},
	},
	["LEVELING\\Thousand Needles (33-34)"] = {
		{ids="2841,2842,2843,2904", cond_if=[[guideflag("Gnomerflag")]]},
		{ids="2945", cond_if=[[itemcount(9326) > 0 and guideflag("Gnomerflag")]]},
		{ids="1148", cond_if=[[(haveq(1147) or completedq(1147)) or (haveq(1148) or completedq(1148))]]},
		{ids="2949,2952", cond_if=[[(haveq(2945) or completedq(2945)) and guideflag("Gnomerflag")]]},
		{ids="1147,1110,1114,1104,1115,1105,1176,1175,5762,1106,1178,5361,1184,1180,1181,575,605,201,189,213,1182"},
	},
	["LEVELING\\Un'Goro Crater (53-54)"] = {
		{ids="4245", cond_if=[[haveq(4244) or completedq(4244)]]},
		{ids="4244", cond_if=[[(itemcount(10561) > 0) or (haveq(4244) or completedq(4244))]]},
		{ids="4496,4145,3881,3883,3882,4288,4501,4492,4503,4301,974,980,4491,4285,4287,4147,4243,4321,3762,1000,3562,3761,1123,3782,5159"},
	},
	["LEVELING\\Undead Starter (1-13)"] = {
		{ids="1881,1882", cond_if=[[Mage]]},
		{ids="1818,1819,1820", cond_if=[[Warrior]]},
		{ids="3096", cond_if=[[Scourge Rogue]]},
		{ids="5660", cond_if=[[Priest]]},
		{ids="3098", cond_if=[[Scourge Mage]]},
		{ids="1885,1886", cond_if=[[Rogue]]},
		{ids="1478,1473,1471", cond_if=[[Warlock]]},
		{ids="361", cond_if=[[itemcount(2839) > 0]]},
		{ids="3097,5651,5650", cond_if=[[Scourge Priest]]},
		{ids="3095", cond_if=[[Scourge Warrior]]},
		{ids="1470,3099", cond_if=[[Scourge Warlock]]},
		{ids="363,364,3901,376,6395,380,3902,381,382,383,8,365,5481,404,367,427,368,370,407,426,5482,784,791,2161,786,817,818,808,826,823,830,825,831,837,815,834,835,354,362,375,374,358,398,369,371,359,355,360,356,492,445"},
	},
	["LEVELING\\Warlock Class Quests"] = {
		{ids="1485,1499,1506,1501,1504", cond_if=[[Orc Warlock]]},
		{ids="1470,1478,1473,1471", cond_if=[[Scourge Warlock]]},
		{ids="1507,1508,1509,1510,1511,1515,1512,1513,2996,1801,1803,1805,1471,3631,4490,7601,7602,8420,8421,8421,8422,7603,7562,7563,7564,7623,7626,7627,7628,7630,7624,7625,7629,7631", cond_if=[[Warlock]]},
	},
	["LEVELING\\Warrior Class Quests"] = {
		{ids="1718,1719,1791,1712,1714,1713,1792,8417,8423,8424,8425", cond_if=[[Warrior]]},
		{ids="1818,1819,1820,1821", cond_if=[[Scourge Warrior]]},
		{ids="1498,1502,1503", cond_if=[[(Orc Warrior) or (Troll Warrior) or (Tauren Warrior)]]},
		{ids="1505", cond_if=[[Tauren Warrior]]},
		{ids="1505", cond_if=[[(Orc Warrior) or (Troll Warrior)]]},
	},
	["LEVELING\\Western & Eastern Plaguelands (56-58)"] = {
		{ids="7814,7827,7834", cond_if=[[itemcount(4306) >= 60]]},
		{ids="7817,7831,7835", cond_if=[[itemcount(4338) >= 60]]},
		{ids="7818,7824,7836", cond_if=[[itemcount(14047) >= 60]]},
		{ids="7813,7826,7833", cond_if=[[itemcount(2592) >= 60]]},
		{ids="5094,5096,5405,5098,5228,5229,5230,5021,5023,5231,5232,5058,5060,4971,4972,838,964,5233,5901,5234,4984,6004,6023,4985,5542,5543,5544,6022,6042,5149,5152,5241,5211,6021,5281,6164,5742,4987,5153,5154,5210,5235,5902,5049,5050,5181,5236,6390,5051,5238,8276"},
	},
	["LEVELING\\Winterspring (58-59)"] = {
		{ids="6031", cond_if=[[rep('Timbermaw Hold') >= Friendly and level < 60 and itemcount(14047) >= 30]]},
		{ids="7821", cond_if=[[itemcount(4306) >= 60]]},
		{ids="7823", cond_if=[[itemcount(14047) >= 60]]},
		{ids="7822", cond_if=[[itemcount(4338) >= 60]]},
		{ids="7820", cond_if=[[itemcount(2592) >= 60]]},
		{ids="8467", cond_if=[[itemcount(21377) >= 5]]},
		{ids="977,4809,8471,4721,4882,5163,1124,5527,4883,7492,3961"},
	},
	["PROFESSIONS\\Blacksmithing\\Blacksmithing (1-300)"] = {
		{ids="7652,7655,7654"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Armorsmith\\Armorsmith Questline"] = {
		{ids="5301,2756,2757,2760,2761,2762,2763,2765,2764,2771,2772,2773,3321"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Axesmith Questline"] = {
		{ids="5306"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Hammersmith Questline"] = {
		{ids="5305"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Swordsmith Questline"] = {
		{ids="5307"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Weaponsmith Questline"] = {
		{ids="5302"},
	},
	["PROFESSIONS\\Cooking\\Cooking (1-300)"] = {
		{ids="6611,6610"},
	},
	["PROFESSIONS\\Cooking\\Cooking + Fishing (1-300)"] = {
		{ids="6608,6607,6610"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Gnomish Engineering\\Gnome Engineer Membership Card Renewal"] = {
		{ids="3645"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Gnomish Engineering\\Gnomish Engineering Questline"] = {
		{ids="3637,3642,3643"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineer Membership Card Renewal"] = {
		{ids="3644"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineering Questline"] = {
		{ids="3633,3638,3639"},
	},
	["PROFESSIONS\\First Aid\\First Aid (1-300)"] = {
		{ids="6622"},
	},
	["PROFESSIONS\\Fishing\\Fishing (1-300)"] = {
		{ids="6608,6607"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Dragonscale Leatherworking\\Dragonscale Leatherworking Questline"] = {
		{ids="5145"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Elemental Leatherworking\\Elemental Leatherworking Questline"] = {
		{ids="5146"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Tribal Leatherworking\\Tribal Leatherworking Questline"] = {
		{ids="2854,2855,2856,2857,2858,2859,2860,5143"},
	},
	["PROFESSIONS\\Lockpicking\\Lockpicking (1-300)"] = {
		{ids="2379,2382,2381"},
	},
	["REPUTATIONS\\Reputations\\Argent Dawn"] = {
		{ids="5503"},
	},
	["REPUTATIONS\\Reputations\\Bloodsail Buccaneers"] = {
		{ids="1036,9272,4621"},
	},
	["REPUTATIONS\\Reputations\\Brood of Nozdormu"] = {
		{ids="8579", cond_if=[[not completedq(8579)]]},
	},
	["REPUTATIONS\\Reputations\\Cenarion Circle"] = {
		{ids="8318"},
	},
	["REPUTATIONS\\Reputations\\Darkspear Trolls"] = {
		{ids="7834", cond_if=[[not completedq(7834)]]},
		{ids="7833", cond_if=[[not completedq(7833)]]},
		{ids="7835", cond_if=[[not completedq(7835)]]},
		{ids="7836", cond_if=[[not completedq(7836)]]},
	},
	["REPUTATIONS\\Reputations\\Gelkis & Magram Centaur Clans"] = {
		{ids="1368,1367", cond_if=[[Horde]]},
		{ids="1382,1385", cond_if=[[Alliance]]},
	},
	["REPUTATIONS\\Reputations\\Orgrimmar"] = {
		{ids="7827", cond_if=[[not completedq(7827)]]},
		{ids="7824", cond_if=[[not completedq(7824)]]},
		{ids="7831", cond_if=[[not completedq(7831)]]},
		{ids="7826", cond_if=[[not completedq(7826)]]},
	},
	["REPUTATIONS\\Reputations\\Steamwheedle Cartel"] = {
		{ids="7725", cond_if=[[not rep("Steamwheedle Cartel") == Exalted]]},
		{ids="7003"},
	},
	["REPUTATIONS\\Reputations\\Thorium Brotherhood"] = {
		{ids="7723,7724,7727,7722,7728,7729"},
	},
	["REPUTATIONS\\Reputations\\Thunder Bluff"] = {
		{ids="7822", cond_if=[[not completedq(7822)]]},
		{ids="7820", cond_if=[[not completedq(7820)]]},
		{ids="7823", cond_if=[[not completedq(7823)]]},
		{ids="7821", cond_if=[[not completedq(7821)]]},
	},
	["REPUTATIONS\\Reputations\\Timbermaw Hold"] = {
		{ids="8470", cond_if=[[itemcount(20741) > 0]]},
		{ids="8460,8462,8461,8465,8464"},
	},
	["REPUTATIONS\\Reputations\\Undercity"] = {
		{ids="7814", cond_if=[[not completedq(7814)]]},
		{ids="7813", cond_if=[[not completedq(7813)]]},
		{ids="7818", cond_if=[[not completedq(7818)]]},
		{ids="7817", cond_if=[[not completedq(7817)]]},
	},
	["REPUTATIONS\\Reputations\\Wintersaber Trainers"] = {
		{ids="8464,5201,5981", cond_if=[[rep('Wintersaber Trainers') < Exalted]]},
		{ids="4970", cond_if=[[repval('Wintersaber Trainers','Neutral') < 1500]]},
	},
}
GQ.Quest_Cache_Turnin_Horde = {
	["DUNGEONS\\Blackfathom Deeps Quests"] = {
		{ids="6564,6563,6565,6921,6922,6561"},
	},
	["DUNGEONS\\Blackrock Depths Quests"] = {
		{ids="4133,3441,3442,3443,3452,3453,3454,3462,3463,3481,4324,4022,4061,4062,3801,3802,4123,4136,4024,3906,4134,4081,4063,4201,3907,4082,3981,3982,4001,4002,4003,4004"},
	},
	["DUNGEONS\\Dire Maul East Quests"] = {
		{ids="5527,7489,7441,5526"},
	},
	["DUNGEONS\\Dire Maul North Quests"] = {
		{ids="5518,7429,7703,7481"},
	},
	["DUNGEONS\\Dire Maul North Tribute (58-60)"] = {
		{ids="1193"},
	},
	["DUNGEONS\\Dire Maul West Quests"] = {
		{ids="7461,7462"},
	},
	["DUNGEONS\\Gnomeregan Quests"] = {
		{ids="2842,2843,2841"},
	},
	["DUNGEONS\\Lower Blackrock Spire Quests"] = {
		{ids="3520,3527,4787,3528,5065,4981,4982,4867,4742,4866,4729,4862,4903,4983,4724,4788"},
	},
	["DUNGEONS\\Maraudon Quests"] = {
		{ids="7044,7046,7068,7029,7064,7067,7028,7066"},
	},
	["DUNGEONS\\Ragefire Chasm Quests"] = {
		{ids="5726,5727,5722,5761,5728,5729,5730,5725,5724,5723"},
	},
	["DUNGEONS\\Raid Attunements\\Blackwing Lair Attunement"] = {
		{ids="7761"},
	},
	["DUNGEONS\\Raid Attunements\\Molten Core Attunement"] = {
		{ids="7848"},
	},
	["DUNGEONS\\Raid Attunements\\Naxxramas Attunement"] = {
		{ids="9123", cond_if=[[haveq(9123) or completedq(9123)]]},
		{ids="9122", cond_if=[[haveq(9122) or completedq(9122)]]},
		{ids="9121", cond_if=[[haveq(9121) or completedq(9121)]]},
	},
	["DUNGEONS\\Raid Attunements\\Onyxia's Lair Attunement"] = {
		{ids="4903,4941,4974,6566,6567,6567,6568,6569,6570,6582,6583,6584,6585,6601,6601,6602,6602"},
	},
	["DUNGEONS\\Razorfen Downs Quests"] = {
		{ids="6522,6626,3523,3525,3341,6521"},
	},
	["DUNGEONS\\Razorfen Kraul Quests"] = {
		{ids="1144,1221,1102,1109,6522"},
	},
	["DUNGEONS\\Scarlet Monastery Armory Quests"] = {
		{ids="1048"},
	},
	["DUNGEONS\\Scarlet Monastery Cathedral Quests"] = {
		{ids="1048"},
	},
	["DUNGEONS\\Scarlet Monastery Graveyard Quests"] = {
		{ids="1109,1051,1113"},
	},
	["DUNGEONS\\Scarlet Monastery Library Quests"] = {
		{ids="1049", cond=[[Orc]]},
		{ids="1149,1150,1151,1152,1154,6627,1159,1160,6628,1048,1394"},
	},
	["DUNGEONS\\Scholomance Quests"] = {
		{ids="4726,4808,4809,4810,4907,4734,4735,5522,5531,5094,5096,5098,838,964,5514,5801,5803,5382,5341,5529,4771,5515,5582,5384,5461,5462,5463,5464,5465,5466"},
	},
	["DUNGEONS\\Shadowfang Keep Quests"] = {
		{ids="1098,1014,1013"},
	},
	["DUNGEONS\\Stratholme - Live Side Quests"] = {
		{ids="5281,5542,5543,5544,5742,5781,5845,5846,5282,5848,5214,5251,5262"},
	},
	["DUNGEONS\\Stratholme - Undead Side Quests"] = {
		{ids="5382,5515,5384,5461,5462,5251,5262,6022,6133,6042,6135,6136,5463,5263,5212,5464,5243,6163,5213"},
	},
	["DUNGEONS\\Temple of Atal'Hakkar Quests"] = {
		{ids="3380,3444,3520,3527,1424,1429,4787,1444,4145,4147,3446,3447,3373,1445,1446,3528,4146"},
	},
	["DUNGEONS\\Tier 0.5 Dungeon Gear Questline"] = {
		{ids="8990", cond_if=[[haveq(8990)]]},
		{ids="8919,8943,9021,9012", cond_if=[[Warlock]]},
		{ids="8969", cond_if=[[haveq(8969)]]},
		{ids="8989", cond_if=[[haveq(8989)]]},
		{ids="8918,8942,8957,9011", cond_if=[[Shaman]]},
		{ids="8988", cond_if=[[haveq(8988)]]},
		{ids="8916,8940,9019,9009", cond_if=[[Priest]]},
		{ids="8913,8927,9016,9007", cond_if=[[Druid]]},
		{ids="8965", cond_if=[[haveq(8965)]]},
		{ids="8987", cond_if=[[haveq(8987)]]},
		{ids="8963", cond_if=[[haveq(8963)]]},
		{ids="8985", cond_if=[[haveq(8985)]]},
		{ids="8986", cond_if=[[haveq(8986)]]},
		{ids="8915,8939,9018,9014", cond_if=[[Mage]]},
		{ids="8992", cond_if=[[haveq(8992)]]},
		{ids="8991", cond_if=[[haveq(8991)]]},
		{ids="8914,8938,9017,9008", cond_if=[[Hunter]]},
		{ids="8967", cond_if=[[haveq(8967)]]},
		{ids="8917,8941,9020,9010", cond_if=[[Rogue]]},
		{ids="8966", cond_if=[[haveq(8966)]]},
		{ids="8964", cond_if=[[haveq(8964)]]},
		{ids="8920,8944,9022,9013", cond_if=[[Warrior]]},
		{ids="8968", cond_if=[[haveq(8968)]]},
		{ids="8962", cond_if=[[haveq(8962)]]},
		{ids="8923,8921,8924,8925,8928,8978,8930,8945,8946,8947,8948,8949,8950,9015,9032,8961,8970,8994,8995,8996,8998"},
	},
	["DUNGEONS\\Uldaman Quests"] = {
		{ids="2278,2280", cond_if=[[level >=40]]},
		{ids="2258,2283,2284,2318,2338,2202,2339,2418,709,2342,2340,2341"},
	},
	["DUNGEONS\\Upper Blackrock Spire Quests"] = {
		{ids="4769,4726,4808,4809,4810,4907,6804,6805,4903,4768,4903,4941,4734,5047,5160,5161,5162,5164,6821,4735,4974,6566,6567,6567,6568,6569,6570,6582,6583,6584,6585,6601,6601,6602,6602"},
	},
	["DUNGEONS\\Wailing Caverns Quests"] = {
		{ids="6981", cond_if=[[haveq(6981) or completedq(6981)]]},
		{ids="3366", cond_if=[[haveq(3366) or completedq(3366)]]},
		{ids="886,870,877,880,1489,1490,865,1486,1487,1491,959,914,3369,962"},
	},
	["DUNGEONS\\Zul'Farrak Quests"] = {
		{ids="2933,2934,2935,3520,3527,2768,2865,3042,2770,2846,2936"},
	},
	["EVENTS\\Children's Week\\Children's Week Main Questline"] = {
		{ids="172,1800,910,911,915,925,5502"},
	},
	["EVENTS\\Darkmoon Faire\\Elwynn Forest\\Sayge's Fortunes (Elwynn Forest)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Darkmoon Faire\\Mulgore\\Sayge's Fortunes (Mulgore)"] = {
		{ids="7937,7938,7944,7945"},
	},
	["EVENTS\\Feast of Winter Veil\\Feast of Winter Veil Quest"] = {
		{ids="6964,7061,6961,6962,6963,6983,6984,8746"},
	},
	["EVENTS\\Hallow's End\\Hallow's End Quests"] = {
		{ids="8359,8358,8360,8354,8312,1657"},
	},
	["EVENTS\\Harvest Festival\\Harvest Festival Quest"] = {
		{ids="8150"},
	},
	["EVENTS\\Love is in the Air\\Love is in the Air Quests"] = {
		{ids="8904,8979,8980,8982,8983,8984"},
	},
	["EVENTS\\Lunar Festival\\Lunar Festival Main Questline"] = {
		{ids="8873,8867,8883"},
	},
	["EVENTS\\Midsummer Fire Festival\\Midsummer Fire Festival Quests"] = {
		{ids="9319", cond_if=[[readyq(9319) or completedq(9319)]]},
		{ids="9331", cond_if=[[readyq(9331) or completedq(9331)]]},
		{ids="9330", cond_if=[[readyq(9330) or completedq(9330)]]},
		{ids="9332", cond_if=[[readyq(9332) or completedq(9332)]]},
		{ids="9368,9389,9388,9323,9322"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Cenarion Battlegear"] = {
		{ids="8800,8548,8572,8573,8574"},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Cloak Quest"] = {
		{ids="8557", cond=[[Warrior]]},
		{ids="8695", cond=[[Paladin]]},
		{ids="8690", cond=[[Shaman]]},
		{ids="8693", cond=[[Rogue]]},
		{ids="8691", cond=[[Mage]]},
		{ids="8692", cond=[[Druid]]},
		{ids="8689", cond=[[Priest]]},
		{ids="8696", cond=[[Hunter]]},
		{ids="8694", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Ring Quest"] = {
		{ids="8556", cond=[[Warrior]]},
		{ids="8703", cond=[[Paladin]]},
		{ids="8698", cond=[[Shaman]]},
		{ids="8701", cond=[[Rogue]]},
		{ids="8699", cond=[[Mage]]},
		{ids="8700", cond=[[Druid]]},
		{ids="8697", cond=[[Priest]]},
		{ids="8704", cond=[[Hunter]]},
		{ids="8702", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Ruins of Ahn'Qiraj Weapon Quest"] = {
		{ids="8558", cond=[[Warrior]]},
		{ids="8711", cond=[[Paladin]]},
		{ids="8706", cond=[[Shaman]]},
		{ids="8709", cond=[[Rogue]]},
		{ids="8707", cond=[[Mage]]},
		{ids="8708", cond=[[Druid]]},
		{ids="8705", cond=[[Priest]]},
		{ids="8712", cond=[[Hunter]]},
		{ids="8710", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Boots Quest"] = {
		{ids="8559", cond=[[Warrior]]},
		{ids="8655", cond=[[Paladin]]},
		{ids="8621", cond=[[Shaman]]},
		{ids="8637", cond=[[Rogue]]},
		{ids="8634", cond=[[Mage]]},
		{ids="8665", cond=[[Druid]]},
		{ids="8596", cond=[[Priest]]},
		{ids="8626", cond=[[Hunter]]},
		{ids="8660", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Helm Quest"] = {
		{ids="8561", cond=[[Warrior]]},
		{ids="8628", cond=[[Paladin]]},
		{ids="8623", cond=[[Shaman]]},
		{ids="8639", cond=[[Rogue]]},
		{ids="8632", cond=[[Mage]]},
		{ids="8667", cond=[[Druid]]},
		{ids="8592", cond=[[Priest]]},
		{ids="8657", cond=[[Hunter]]},
		{ids="8662", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Legs Quest"] = {
		{ids="8560", cond=[[Warrior]]},
		{ids="8629", cond=[[Paladin]]},
		{ids="8624", cond=[[Shaman]]},
		{ids="8640", cond=[[Rogue]]},
		{ids="8631", cond=[[Mage]]},
		{ids="8668", cond=[[Druid]]},
		{ids="8593", cond=[[Priest]]},
		{ids="8658", cond=[[Hunter]]},
		{ids="8663", cond=[[Warlock]]},
	},
	["LEVELING\\Ahn'Qiraj Gear\\Temple of Ahn'Qiraj Shoulder Quest"] = {
		{ids="8544", cond=[[Warrior]]},
		{ids="8630", cond=[[Paladin]]},
		{ids="8602", cond=[[Shaman]]},
		{ids="8641", cond=[[Rogue]]},
		{ids="8625", cond=[[Mage]]},
		{ids="8669", cond=[[Druid]]},
		{ids="8594", cond=[[Priest]]},
		{ids="8659", cond=[[Hunter]]},
		{ids="8664", cond=[[Warlock]]},
	},
	["LEVELING\\Alterac Mountains & Arathi Highlands (38-39)"] = {
		{ids="566", cond_if=[[readyq(566)]]},
		{ids="1712,1713", cond_if=[[Warrior]]},
		{ids="503,506,507,545,557,566,508,638,642,701,702,678,847,651,663,665,662,664,666,668"},
	},
	["LEVELING\\Arathi Highlands (32-33)"] = {
		{ids="676,655,671,672,674,675,677,509,1164,513,550"},
	},
	["LEVELING\\Ashenvale (21-22)"] = {
		{ids="1511,1515,1512,1513", cond_if=[[Warlock]]},
		{ids="2460,2458,2478", cond_if=[[Rogue]]},
		{ids="5642", cond_if=[[Troll Priest]]},
		{ids="6562,6442,1063,1064"},
	},
	["LEVELING\\Ashenvale (26-28)"] = {
		{ids="6504", cond_if=[[haveq(6504) or completedq(6504)]]},
		{ids="6921,6563,6922,6564,6561", cond_if=[[guideflag("BFDflag")]]},
		{ids="6541,6503,6544,24,23,6482,25,1918,6441,824,6462,216,6641,2,1086,1195"},
	},
	["LEVELING\\Azshara (54-54)"] = {
		{ids="3562,3563,3505,3601,5534,3506"},
	},
	["LEVELING\\Badlands (39-40)"] = {
		{ids="705", cond_if=[[haveq(705) or completedq(705)]]},
		{ids="715", cond_if=[[haveq(715) or completedq(715)]]},
		{ids="713", cond_if=[[haveq(713) or completedq(713)]]},
		{ids="1049", cond_if=[[guideflag("SMflag") and not Scourge]]},
		{ids="714", cond_if=[[haveq(714) or completedq(714)]]},
		{ids="1106,710,711,703,1108,1419,2258,1276,1136"},
	},
	["LEVELING\\Blasted Lands (50-51)"] = {
		{ids="2521", cond_if=[[haveq(2521) or completedq(2521)]]},
		{ids="3501", cond_if=[[haveq(3501) or completedq(3501)]]},
		{ids="2601,2603,2581,2583,2585"},
	},
	["LEVELING\\Burning Steppes & Azshara (51-52)"] = {
		{ids="4022", cond_if=[[haveq(4022) or completedq(4022)]]},
		{ids="3821,4726,4296,5535,5536,3504,3517,3561,3565"},
	},
	["LEVELING\\Cenarion Field Duty Combat Assignments"] = {
		{ids="8687", cond_if=[[haveq(8687)]]},
		{ids="8771", cond_if=[[haveq(8771)]]},
		{ids="8770", cond_if=[[haveq(8770)]]},
		{ids="8501", cond_if=[[haveq(8501)]]},
		{ids="8773", cond_if=[[haveq(8773)]]},
		{ids="8539", cond_if=[[haveq(8539)]]},
		{ids="8775", cond_if=[[haveq(8775)]]},
		{ids="8777", cond_if=[[haveq(8777)]]},
		{ids="8776", cond_if=[[haveq(8776)]]},
		{ids="8774", cond_if=[[haveq(8774)]]},
		{ids="8772", cond_if=[[haveq(8772)]]},
		{ids="8502", cond_if=[[haveq(8502)]]},
		{ids="8507"},
	},
	["LEVELING\\Cenarion Field Duty Logistics Assignments"] = {
		{ids="8810", cond_if=[[haveq(8810)]]},
		{ids="8829", cond_if=[[haveq(8829)]]},
		{ids="8786,8787", cond_if=[[haveq(8786,8787)]]},
		{ids="8804", cond_if=[[haveq(8804)]]},
		{ids="8808", cond_if=[[haveq(8808)]]},
		{ids="8806,8805", cond_if=[[haveq(8806,8805)]]},
		{ids="8809", cond_if=[[haveq(8809)]]},
		{ids="8807", cond_if=[[haveq(8807)]]},
		{ids="8785", cond_if=[[haveq(8785)]]},
		{ids="8507"},
	},
	["LEVELING\\Cenarion Field Duty Tactical Assignments"] = {
		{ids="8739", cond_if=[[haveq(8739)]]},
		{ids="8537,8535", cond_if=[[haveq(8537,8535)]]},
		{ids="8737,8536", cond_if=[[haveq(8737,8536)]]},
		{ids="8538,8498", cond_if=[[haveq(8538,8498)]]},
		{ids="8534,8738,8740", cond_if=[[haveq(8534,8738,8740)]]},
		{ids="8507"},
	},
	["LEVELING\\Desolace (34-36)"] = {
		{ids="5361,1432,1433,1480,1434,1481,1365,5561,1366,1368,5501,5741,6161,6027,1435,1482,1484,1370,5381,6143,6142,1436"},
	},
	["LEVELING\\Desolace (41-41)"] = {
		{ids="1373,1488,6134,1374,5581"},
	},
	["LEVELING\\Druid Class Quests"] = {
		{ids="5928,5922,5930,5932,6002", cond_if=[[Tauren Druid]]},
		{ids="6126,6127,6128,6129,6130,27,28,30,31,9063,9052,9051,9053", cond_if=[[Druid]]},
	},
	["LEVELING\\Dustwallow Marsh (37-38)"] = {
		{ids="1048", cond_if=[[guideflag("SMflag")]]},
		{ids="1202", cond_if=[[not hardcore()]]},
		{ids="1203", cond_if=[[itemcount(3853) > 0]]},
		{ids="1268,1269,1251,1321,1218,1201,1238,1322,1323,1177,1273,1206,1239,232,238"},
	},
	["LEVELING\\Dustwallow Marsh (42-42)"] = {
		{ids="1169,1168,1166,1170,1171,1261,1262"},
	},
	["LEVELING\\Felwood & Winterspring (52-53)"] = {
		{ids="8460,5155,8462,3908,5082,5083,4808,6162,4505,4102,5157,5156,3541"},
	},
	["LEVELING\\Felwood & Winterspring (54-56)"] = {
		{ids="3912", cond_if=[[not hardcore()]]},
		{ids="4809", cond_if=[[readyq(4809)]]},
		{ids="3912", cond_if=[[hardcore()]]},
		{ids="8470", cond_if=[[level < 56.10]]},
		{ids="5159,5202,4506,5084,8461,8465,980,3909,5085,3783,4521,3913,3914,3941,4504,5165,3942,4842,5086,5087,4084,3507,3542,3568,3569,626,7816"},
	},
	["LEVELING\\Feralas & Un'Goro Crater (49-50)"] = {
		{ids="7738", cond_if=[[haveq(7738) or completedq(7738)]]},
		{ids="3062", cond_if=[[not hardcore()]]},
		{ids="7044,7046,7067,7028,7064,7029,7066", cond_if=[[guideflag("Maraflag")]]},
		{ids="3123,3124,3125,3126,3128,7003,7721,3444,3844,4290,4291,3845,3884,4284,3063,7734,3127,3129,81,4300"},
	},
	["LEVELING\\Feralas (43-44)"] = {
		{ids="2766", cond_if=[[haveq(2766) or completedq(2766)]]},
		{ids="2981,2862,2987,2975,2978,2863,2973,2902,2903,2974,2822,7730,7731,2980,2979,1205,3002,3121,2976,7732"},
	},
	["LEVELING\\Hillsbrad Foothills (22-24)"] = {
		{ids="30", cond_if=[[Druid]]},
		{ids="2479,2480", cond_if=[[Rogue]]},
		{ids="5644", cond_if=[[Scourge Priest]]},
		{ids="1098,1014,1013", cond_if=[[guideflag("SFKflag")]]},
		{ids="264,3301,493,1065,494,1066,496,499,549,498,501,527,502,528"},
	},
	["LEVELING\\Hillsbrad Foothills (30-32)"] = {
		{ids="553", cond_if=[[not hardcore()]]},
		{ids="63,100", cond_if=[[Shaman]]},
		{ids="1791", cond_if=[[Warrior]]},
		{ids="529,7321,532,552,544,556,546,539,567,533"},
	},
	["LEVELING\\Hunter Class Quests"] = {
		{ids="6061,6087,6089", cond_if=[[Tauren Hunter]]},
		{ids="6062,6083,6082,6081", cond_if=[[(Orc Hunter) or (Troll Hunter)]]},
		{ids="8151,8153,8231,8232,7632,7636,7635", cond_if=[[Hunter]]},
	},
	["LEVELING\\Mage Class Quests"] = {
		{ids="1883,1884,1959,1960,1961,1943,1944,1945,1947,1949,1950,1948,1951,1952,1953,1954,1955,1956,1957,2861,2846,7463", cond_if=[[Mage]]},
	},
	["LEVELING\\Orc & Troll Starter (1-13)"] = {
		{ids="818", cond_if=[[readyq(818)]]},
		{ids="3086", cond_if=[[Troll Mage]]},
		{ids="2383,3065,1818,1819,1820", cond_if=[[Warrior]]},
		{ids="3089,3084,1516,1517,1518,2983,1524,1525,1526,1527", cond_if=[[Shaman]]},
		{ids="3085", cond_if=[[Troll Priest]]},
		{ids="3087,3082,6062,6083,6082,831,6081", cond_if=[[Hunter]]},
		{ids="805", cond_if=[[haveq(805) or completedq(805)]]},
		{ids="3088,3083", cond_if=[[Rogue]]},
		{ids="792", cond_if=[[not Warlock]]},
		{ids="361", cond_if=[[haveq(361) or completedq(361)]]},
		{ids="1881,1882", cond_if=[[Mage]]},
		{ids="5649,5648,5654", cond_if=[[Priest]]},
		{ids="1485,1499,3090,1478,1473,1471", cond_if=[[Warlock]]},
		{ids="4641,790,788,804,4402,789,5441,794,6394,786,823,2161,784,830,791,808,826,818,817,825,815,837,834,835,816,831,813,812,367,375,354,362,355,358,398,368,356"},
	},
	["LEVELING\\Priest Class Quests"] = {
		{ids="5658,5644", cond_if=[[Scourge Priest]]},
		{ids="5652,5643", cond_if=[[Troll Priest]]},
		{ids="8254,8255,8256,8257,8916", cond_if=[[Priest]]},
	},
	["LEVELING\\Rogue Class Quests"] = {
		{ids="2460,2458,2478,2479,2480,8233,8234,8235,8236", cond_if=[[Rogue]]},
	},
	["LEVELING\\Scepter of the Shifting Sands"] = {
		{ids="8286,8288,8301,8302,8303,8305,8519,8555,8575,8576,8599,8597,8598,8584,8585,8606,8577,8733,8734,8735,8736,8586,8578,8587,8620,8741,8730,8728,8729,8743"},
	},
	["LEVELING\\Scourge Invasion"] = {
		{ids="9154,9247,9153,9263,9265,9264,9299,9295,9301,9300,9302,9304"},
	},
	["LEVELING\\Searing Gorge (51-51)"] = {
		{ids="4449,3441,3442,3443,3452,3453,3454,3462,4451,3463,3481,7723,7724,7727,7728,7729"},
	},
	["LEVELING\\Season of Discovery Events\\Blackrock Eruption"] = {
		{ids="84349,84355,84351,84348,84372,84356,84359,84350,84360"},
	},
	["LEVELING\\Shaman Class Quests"] = {
		{ids="1516,1517,1518", cond_if=[[(Orc Shaman) or (Troll Shaman)]]},
		{ids="1519,1520,1521", cond_if=[[Tauren Shaman]]},
		{ids="2983,2984,1524,1525,1526,1527,1528,1530,1535,1536,1534,220,63,100,96,1531,8410,8412,8413", cond_if=[[Shaman]]},
	},
	["LEVELING\\Silithus (59-60)"] = {
		{ids="1124,8276,1125,8277,8280,8284,8285,8279,8281,8278,8287,8304,8318,5163,5527"},
	},
	["LEVELING\\Silverpine Forest (13-15)"] = {
		{ids="6321,6323,6322,6324", cond_if=[[Scourge]]},
		{ids="5722,5723,5722", cond_if=[[Tauren and guideflag("RFCflag")]]},
		{ids="1886,1898,1899,1978", cond_if=[[Scourge Rogue]]},
		{ids="5726,5727,5761,5728", cond_if=[[guideflag("RFCflag")]]},
		{ids="435,449,445,3221,429,421,430,425,422,437,438,477,478,423,481,482,439,447,1359"},
	},
	["LEVELING\\Stonetalon Mountains (25-26)"] = {
		{ids="1096,6393,6282,6301,1087,6381,1058,1068"},
	},
	["LEVELING\\Stranglethorn Vale & Swamp of Sorrows (40-41)"] = {
		{ids="1393", cond_if=[[not hardcore()]]},
		{ids="4490", cond_if=[[Warlock]]},
		{ids="1270,669,1240,584,572,577,600,209,598,585,196,1372,1420,1392,698,1424,1389,1116"},
	},
	["LEVELING\\Stranglethorn Vale & Swamp of Sorrows (50-50)"] = {
		{ids="1173", cond_if=[[not hardcore()]]},
		{ids="2874,580,1122,197,208,594,608,1444,624,625,2623,2801"},
	},
	["LEVELING\\Stranglethorn Vale (36-37)"] = {
		{ids="5762,5763,583,185,186,190,194,187,191,581,596,568,582,629,195,188,192,569,570,1182,189,213,201,605,575"},
	},
	["LEVELING\\Stranglethorn Vale (44-45)"] = {
		{ids="339,340,341,342", cond_if=[[haveq(339) or completedq(339)]]},
		{ids="338", cond_if=[[readyq(338) or completedq(338)]]},
		{ids="193,586,588,1118,628,595,606,597,607,599,576,587,604,571,609,617,621,573,589"},
	},
	["LEVELING\\Swamp of Sorrows (45-46)"] = {
		{ids="2784,2621,2622,699,1422,1426,1427,1428,3122"},
	},
	["LEVELING\\Tanaris & Dustwallow Marsh (46-48)"] = {
		{ids="3527,2768,2865,3042,2846", cond_if=[[guideflag("ZFflag")]]},
		{ids="2876", cond_if=[[haveq(2876) or completedq(2876)]]},
		{ids="1119,1120,1187,1188,992,3520,2875,8366,2873,8365,2781,1691,3380,3161,2605,5863,3362,2606,82,351,10,110,113,1172,32,649"},
	},
	["LEVELING\\Tanaris (41-42)"] = {
		{ids="2864,243,2872,379,1690,1707,1117,1137,1183,1186,1190,1194"},
	},
	["LEVELING\\Tanaris (42-43)"] = {
		{ids="992", cond_if=[[not hardcore()]]},
		{ids="654"},
	},
	["LEVELING\\Tauren Starter (1-13)"] = {
		{ids="1818,1819,1820", cond_if=[[Warrior]]},
		{ids="3092", cond_if=[[Tauren Hunter]]},
		{ids="2984,1524,1525,1526,1527", cond_if=[[Shaman]]},
		{ids="6061,6087,6088,6089", cond_if=[[Hunter]]},
		{ids="5928,5922,5930,5932,6002,886", cond_if=[[Druid]]},
		{ids="3094", cond_if=[[Tauren Druid]]},
		{ids="3091", cond_if=[[Tauren Warrior]]},
		{ids="3093,1519,1520,1521", cond_if=[[Tauren Shaman]]},
		{ids="752,747,753,755,750,780,3376,781,757,763,1656,767,748,761,754,745,771,749,766,756,772,773,833,743,746,758,751,854,6361,6362,775,6363,6364,808,826,818,817,816,791,815,2161,784,837,830,823,834,835,831,813,812"},
	},
	["LEVELING\\The Barrens & Stonetalon Mountain (15-21)"] = {
		{ids="1507,1508,1509,1510", cond_if=[[Warlock]]},
		{ids="1528,1530,1535", cond_if=[[Shaman]]},
		{ids="1487,1486,959,1491,914,3369,962", cond_if=[[guideflag("WCflag")]]},
		{ids="6365,6384,6385,6386", cond_if=[[Orc or Troll]]},
		{ids="27,28", cond_if=[[Druid]]},
		{ids="1859,1963,2379,1858,2382,2381", cond_if=[[Rogue]]},
		{ids="6981,3366", cond_if=[[((haveq(6981) or completedq(6981)) or (haveq(3366) or completedq(3366))) and guideflag("WCflag")]]},
		{ids="855", cond_if=[[readyq(855)]]},
		{ids="840,842,1358,871,844,819,887,895,1492,890,892,872,5041,845,850,894,900,901,896,902,848,867,870,903,869,3921,858,3922,881,875,863,4921,877,905,3281,855,851,1061,6548,1483,1093,3261,888,1094,865,1069,821,876,899,880,878,5052,882,883,907,913,853,1489,1490,852,1062,6523,6629,1060,6461,6401,1095"},
	},
	["LEVELING\\The Barrens (24-25)"] = {
		{ids="31", cond_if=[[Druid]]},
		{ids="1536", cond_if=[[Shaman]]},
		{ids="897", cond_if=[[haveq(897) or completedq(897)]]},
		{ids="1067,843,846,849,893,884,885,879,906,868,874,873"},
	},
	["LEVELING\\The Hinterlands (48-49)"] = {
		{ids="7843", cond_if=[[not hardcore()]]},
		{ids="485,485", cond_if=[[haveq(485) or completedq(485)]]},
		{ids="864,650,7840,7815,2742,7839,7844,7841,7842,7828,7829,7830,2933,77,1429,2934,2995,2782,2641,2661,2662"},
	},
	["LEVELING\\Thousand Needles (28-30)"] = {
		{ids="5151", cond_if=[[haveq(5151) or completedq(5151)]]},
		{ids="1718,1719", cond_if=[[Warrior]]},
		{ids="1534,220", cond_if=[[Shaman]]},
		{ids="4770", cond_if=[[haveq(4770) or completedq(4770)]]},
		{ids="5881,4542,1196,1149,4821,4841,1197,4865,4881,4966,1131,5062,1153,4767,5088,5064,5147,4904,1111,1145,1431"},
	},
	["LEVELING\\Thousand Needles (33-34)"] = {
		{ids="2842,2843,2904,2841,2949", cond_if=[[guideflag("Gnomerflag")]]},
		{ids="1531,96", cond_if=[[Shaman]]},
		{ids="2945", cond_if=[[(haveq(2945) or completedq(2945)) and guideflag("Gnomerflag")]]},
		{ids="1146,1112,1114,1147,1110,1104,1105,1176,1175,1148,1178,1180,1115,1181,1184"},
	},
	["LEVELING\\Un'Goro Crater (53-54)"] = {
		{ids="4244", cond_if=[[haveq(4244) or completedq(4244)]]},
		{ids="4245", cond_if=[[haveq(4245) or completedq(4245)]]},
		{ids="4494,4289,4292,974,4492,4491,4501,3882,4288,3883,3881,4145,4503,4243,4301,4285,4287,4321,4496,4120,3518,3762,1000,3761,3782,4147,4502,5158"},
	},
	["LEVELING\\Undead Starter (1-13)"] = {
		{ids="818", cond_if=[[readyq(818)]]},
		{ids="1818,1819,1820", cond_if=[[Warrior]]},
		{ids="3096", cond_if=[[Scourge Rogue]]},
		{ids="361", cond_if=[[haveq(361) or completedq(361)]]},
		{ids="5660", cond_if=[[Priest]]},
		{ids="1881,1882", cond_if=[[Mage]]},
		{ids="1885", cond_if=[[Rogue]]},
		{ids="1478,1473,1471", cond_if=[[Warlock]]},
		{ids="3095", cond_if=[[Scourge Warrior]]},
		{ids="3097,5651,5650", cond_if=[[Scourge Priest]]},
		{ids="3098", cond_if=[[Scourge Mage]]},
		{ids="1470,3099", cond_if=[[Scourge Warlock]]},
		{ids="363,364,376,3901,3902,380,6395,381,382,383,8,367,427,365,404,5481,407,786,823,784,830,791,2161,808,826,818,817,825,815,837,834,835,831,5482,426,368,370,398,358,374,354,362,375,359,356,355,360,371,369,492"},
	},
	["LEVELING\\Warlock Class Quests"] = {
		{ids="1485,1499,1506,1501,1504", cond_if=[[Orc Warlock]]},
		{ids="1470,1478,1473,1471", cond_if=[[Scourge Warlock]]},
		{ids="1507,1508,1509,1510,1511,1515,1512,1513,2996,1758,1803,1805,1471,3631,4490,7601,8420,8421,7602,8422,7603,7562,7563,7564,7626,7627,7628,7630,7623,7624,7625,7629,7631", cond_if=[[Warlock]]},
	},
	["LEVELING\\Warrior Class Quests"] = {
		{ids="1718,1719,1791,1712,1713,8417,8423,8424,8425", cond_if=[[Warrior]]},
		{ids="1818,1819,1820,1821", cond_if=[[Scourge Warrior]]},
		{ids="1505,1498,1502,1503", cond_if=[[(Orc Warrior) or (Troll Warrior) or (Tauren Warrior)]]},
	},
	["LEVELING\\Western & Eastern Plaguelands (56-58)"] = {
		{ids="6029,5096,5228,5229,5021,5230,5231,4971,5098,838,5232,5233,6004,6023,4984,5601,5149,6030,5241,5281,6164,6022,6042,5542,5543,5544,5742,4985,5152,4972,5153,5154,964,5234,5901,5023,5049,6021,5210,5211,5235,5902,5050,5051,5236,6390,5181,3564"},
	},
	["LEVELING\\Winterspring (58-59)"] = {
		{ids="8470", cond_if=[[level < 56.10]]},
		{ids="6031", cond_if=[[rep('Timbermaw Hold') >= Friendly and level < 60 and itemcount(14047) >= 30]]},
		{ids="4809", cond_if=[[readyq(4809)]]},
		{ids="977,4741,4809,8464,8471,1123,4721,4882,4883,4987,7492,4005,3961"},
	},
	["PROFESSIONS\\Blacksmithing\\Blacksmithing (1-300)"] = {
		{ids="7655,7654"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Armorsmith\\Armorsmith Questline"] = {
		{ids="2756,2757,2760,2761,2762,2763,2765,2764,2771,2772,2773,3321,5283"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Axesmith Questline"] = {
		{ids="5306"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Hammersmith Questline"] = {
		{ids="5305"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Master Swordsmith Questline"] = {
		{ids="5307"},
	},
	["PROFESSIONS\\Blacksmithing\\Specialization\\Weaponsmith\\Weaponsmith Questline"] = {
		{ids="5302"},
	},
	["PROFESSIONS\\Cooking\\Cooking (1-300)"] = {
		{ids="6611,6610"},
	},
	["PROFESSIONS\\Cooking\\Cooking + Fishing (1-300)"] = {
		{ids="6608,6607,6610"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Gnomish Engineering\\Gnomish Engineering Questline"] = {
		{ids="3637,3642,3643"},
	},
	["PROFESSIONS\\Engineering\\Specialization\\Goblin Engineering\\Goblin Engineering Questline"] = {
		{ids="3633,3638,3639"},
	},
	["PROFESSIONS\\First Aid\\First Aid (1-300)"] = {
		{ids="6624"},
	},
	["PROFESSIONS\\Fishing\\Fishing (1-300)"] = {
		{ids="6608,6607"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Dragonscale Leatherworking\\Dragonscale Leatherworking Questline"] = {
		{ids="5145"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Elemental Leatherworking\\Elemental Leatherworking Questline"] = {
		{ids="5146"},
	},
	["PROFESSIONS\\Leatherworking\\Specialization\\Tribal Leatherworking\\Tribal Leatherworking Questline"] = {
		{ids="2854,2855,2856,2857,2858,2859,2860,5143"},
	},
	["PROFESSIONS\\Lockpicking\\Lockpicking (1-300)"] = {
		{ids="2379,2382,2381"},
	},
	["REPUTATIONS\\Reputations\\Bloodsail Buccaneers"] = {
		{ids="1036,4621"},
	},
	["REPUTATIONS\\Reputations\\Brood of Nozdormu"] = {
		{ids="8579", cond_if=[[not completedq(8579)]]},
	},
	["REPUTATIONS\\Reputations\\Cenarion Circle"] = {
		{ids="8318"},
	},
	["REPUTATIONS\\Reputations\\Gelkis & Magram Centaur Clans"] = {
		{ids="1368,1367", cond_if=[[Horde]]},
		{ids="1382,1385", cond_if=[[Alliance]]},
	},
	["REPUTATIONS\\Reputations\\Steamwheedle Cartel"] = {
		{ids="7725", cond_if=[[not rep('Steamwheedle Cartel') == Exalted]]},
		{ids="7003"},
	},
	["REPUTATIONS\\Reputations\\Thorium Brotherhood"] = {
		{ids="7723,7724,7727,7728,7729,7722"},
	},
	["REPUTATIONS\\Reputations\\Timbermaw Hold"] = {
		{ids="8470", cond_if=[[haveq(8470) or completedq(8470)]]},
		{ids="8460,8462,8461,8465,8464"},
	},
	["REPUTATIONS\\Reputations\\Wintersaber Trainers"] = {
		{ids="5201,5981", cond_if=[[rep('Wintersaber Trainers') < Exalted]]},
		{ids="8464", cond_if=[[haveq(8464) or completedq(8464)]]},
		{ids="4970", cond_if=[[haveq(4970) or completedq(4970)]]},
	},
}
