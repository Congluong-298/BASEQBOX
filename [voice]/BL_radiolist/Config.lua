Config = {}

Config.UseRPName = true 							-- If set to true, it uses either esx-legacy or qb-core built-in function to get players' RP name

Config.LetPlayersChangeVisibilityOfRadioList = true	-- Let players to toggle visibility of the list
Config.RadioListVisibilityCommand = "danhsachdam" 	-- Only works if Config.LetPlayersChangeVisibilityOfRadioList is set to true

Config.LetPlayersSetTheirOwnNameInRadio = false		-- Let players to customize how their name is displayed on the list
Config.ResetPlayersCustomizedNameOnExit = true		-- Only works if Config.LetPlayersSetTheirOwnNameInRadio is set to true - Removes customized name players set for themselves on their server exit
Config.RadioListChangeNameCommand = "nameinradio" 	-- Only works if Config.LetPlayersSetTheirOwnNameInRadio is set to true

Config.RadioChannelsWithName = {
	["0"] = "GM",
	["1"] = "1",
	["2"] = "2",
	["3"] = "3",
	["4"] = "4",
	["5"] = "5"
}