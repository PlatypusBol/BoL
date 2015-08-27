--PlatyAIO by Platypus

--UPL start
require("UPL")
UPL = UPL()

function OnLoad()
	--spellname table for autocast
	spellNames = 
		{
		Aatrox     = {Q = "AatroxQ", WHeal = "AatroxWONHAttackLife", WDmg = "AatroxWONHAttackPower", E = "AatroxE" , R = "AatroxR"},
		Ahri       = {Q = "AhriOrbofDeception", W = "AhriFoxFire", E = "AhriSeduce" , R = "AhriTumble"},
		Akali      = {Q = "AkaliMota", W = "AkaliSmokeBomb", E = "AkaliShadowSwipe" , R = "AkaliShadowDance"},
		Alistar    = {Q = "Pulverize", W = "Headbutt", E = "TriumphantRoar" , R = "FerociousHowl"},
		Amumu 	   = {Q = "BandageToss", W = "AuraofDespair", E = "Tantrum" , R = "CurseoftheSadMummy"},
		Anivia 	   = {Q = "FlashFrost", W = "Crystallize", E = "Frostbite" , R = "GlacialStorm"},
		Annie 	   = {Q = "Disintegrate", W = "Incinerate", E = "MoltenShield" , R = "InfernalGuardian"},
		Ashe 	   = {Q = "AsheQ", W = "Volley", E = "AsheSpiritOfTheHawk" , R = "EnchantedCrystalArrow"},
		Azir       = {Q = "AzirQ", W = "AzirWSpawnSoldier", E = "AzirE", R = "AzirR"},
		Bard       = {Q = "BardQ", W = "BardW", E = "BardE" , R = "BardR"},
		Blitzcrank = {Q = "RocketGrabMissile", W = "Overdrive", E = "PowerFistAttack" , R = "StaticField"},
		Brand      = {Q = "BrandBlazeMissile", W = "BrandScorchAttack", E = "BrandConflagrationMissile" , R = "BrandWildfireMissile"},
		Braum      = {Q = "BraumQMissile", W = "BraumW", E = "BraumE" , R = "BraumRWrapper"},
		Caitlyn    = {Q = "CaitlynPiltoverPeacemaker", W = "CaitlynYordleTrap", E = "CaitlynEntrapmentMissile" , R = "CaitlynAceintheHoleMissile", P = "CaitlynHeadshotMissile"},
		Cassiopeia = {Q = "CassiopeiaNoxiousBlast", W = "CassiopeiaMiasma", E = "CassiopeiaTwinFang" , R = "CassiopeiaPetrifyingGaze"},
		Chogath    = {Q = "Rupture", W = "FeralScream", E = "VorpalSpikes" , R = "Feast"},
		Corki      = {Q = "PhosphorusBomb", W = "CarpetBomb", E = "GGun", R = "MissileBarrageMissile", R2 = "MissileBarrageMissile2"},
		Darius     = {Q = "DariusCleave", W = "DariusNoxianTacticsONH", E = "DariusAxeGrabCone" , R = "DariusExecute"},
		Diana      = {Q = "DianaArc", W = "DianaOrbs", E = "DianaVortex" , R = "DianaTeleport"},
		DrMundo    = {Q = "InfectedCleavedMissleCast", W = "BurningAgony", E = "Masochism" , R = "Sadism"},
		Draven     = {QInitalCast = "DravenSpinning", QAttack = "DravenSpinningAttack", QCritAttack = "DravenSpinningAttackCrit", QReturn = "DravenSpinningReturn", W = "DravenFury", E = "DravenDoubleShotMissle" , R = "DravenRCast"},
		Ekko       = {Q = "EkkoQ", W = "EkkoW", E = "EkkoEAttack" , R = "EkkoR"},
		Elise      = {Q = "EliseHumanQ", Q2 = "EliseSpiderQCast", W = "EliseHumanW", W2 = "EliseSpiderW", E = "EliseHumanE", E2 = "EliseSpiderEInitial", R = "EliseR", R = "EliseRSpider"},
		Evelynn    = {Q = "EvelynnQ", W = "EvelynnW", E = "EvelynnE" , R = "EvelynnR"},
		Ezreal     = {Q = "EzrealMysticShotMissile", Q2 = "EzrealMysticShotPulseMissile", W = "EzrealEssenceFluxMissile", E = "EzrealArcaneShiftMissile", R = "EzrealTrueShotBarrage"},
		Fiddle     = {Q = "Terrify", W = "Drain", E = "FiddlesticksDarkWind" , R = "Crowstorm"},
		Fiora      = {Q = "FioraQ", W = "FioraW", E = "FioraE" , R = "FioraR"},
		Fizz       = {Q = "FizzPiercingStrike", W = "FizzSeastonePassive", E = "FizzTrickSlam", R = "FizzMarinerDoomMissile"},
		Galio      = {Q = "GalioResoluteSmite", W = "GalioBulwark", E = "GalioRighteousGust" , R = "GalioIdolOfDurand"},
		Gankplank  = {Q = "GangplankQWrapper", W = "GangplankW", E = "GangplankE", R = "GangplankR"},
		Garen      = {Q = "GarenQ", W = "GarenW", E = "GarenE" , R = "GarenR"},
		Gnar       = {Q = "gnarqmissile", QBig = "GnarBigQMissile", W = "GnarW", WBig = "gnarbigw", E = "GnarE", EBig = "gnarbigE", R = "GnarR"},
		Gragas     = {Q = "GragasQ", W = "GragasWAttack", E = "GragasE", R = "GragasR"},
		Graves     = {Q = "GravesClusterShot", W = "GravesSmokeGrenade", E = "GravesMove" , R = "GravesChargeShot"},
		Hecarim    = {Q = "HecarimRapidSlash", W = "HecarimW", E = "hecarimrampattack" , R = "HecarimUlt"},
		Heimerdinger = {Q = "HeimerdingerQ", W = "HeimerdingerW", E = "HeimerdingerE" , R = "HeimerdingerR"},
		Irelia     = {Q = "JreliaGatotsu", W = "IreliaHitenStyle", E = "IreliaEquilibriumStrike" , R = "IreliaTranscendentBlades"},
		Janna      = {Q = "HowlingGale", W = "SowTheWind", E = "EyeOfTheStorm" , R = "ReapTheWhirlwind"},
		JarvanIV   = {Q = "JarvanIVDragonStrike", W = "JarvanIVGoldenAegis", E = "JarvanIVDemacianStandard" , R = "JarvanIVCataclysm"},
		Jax        = {Q = "JaxLeapStrike", W = "JaxEmpowerTwo", E = "JaxCounterStrike", R = "JaxRelentlessAssault"},
		Jayce      = {QWall = "JayceShockBlastWallMis", QNoWall = "JayceShockBlastMis", QHammer = "JayceToTheSkies", W = "JayceHyperChargeRangedAttack", WHammer = "JayceStaticField", E = "jayceaccelerationgate", EHammer = "JayceThunderingBlow", SwaptoHammer = "jaycestancegth", SwaptoGun = "JayceStanceHtG"},
		Jinx       = {Q = "JinxQ", W = "JinxW", W2 = "JinxWMissile", E = "JinxE" , R = "JinxR"},
		Kalista    = {Q = "KalistaMysticShot", Q2 = "kalistamysticshotmis", W = "KalistaW", E = "KalistaExpungeWrapper" , R = "KalistaRx"},
		Karma      = {Q = "KarmaQMissile", QManta = "KarmaQMissileMantra", W  = "KarmaWNonMantra", WManta = "KarmaWMantra", E = "KarmaSolKimShield", R = "KarmaMantra" },
		Karthus    = {Q = "KarthusLayWasteA1", Q2 = "karthuslaywastea2", Q3 = "karthuslaywastea3", W = "KarthusWallOfPain", E = "KarthusDefile" , R = "KarthusFallenOne"},
		Kassadin   = {Q = "NullLance", W = "NetherBlade", E = "ForcePulse" , R = "RiftWalk"},
		Kayle      = {Q = "JudicatorReckoning", W = "JudicatorDivineBlessing", E = "JudicatorRighteosFury" , R = "JudicatorIntervention"},
		Kennen     = {Q = "KennenShurikenHurlMissile1", W = "KennenBringTheLight", E = "KennenLightningRush" , R = "KennenShurikenStorm"},
		KhaZix     = {Q = "KhazixQ", W = "KhazixMissile", W2 = "KhazixWMissileSides", W3 = "KhazixWMissileSidesEnhanced", E = "KhazixE", E2 = "KhazixEInvisMissile" , R = "KhazixR"},
		KogMaw     = {Q = "KogMawQMis", W = "KogMawBioArcaneBarrage", E = "KogMawVoidOozeMissile" , R = "KogMawLivingArtillery"},
		LeBlanc    = {Q = "LeblancChaosOrb", W = "LeblancSlide", W2 = "leblancslidereturn", E = "LeblancSoulShackle" , R = "LeblancMimic", RQ = "LeblancChaosOrbM", RW = "LeblancSlideM", RW2 = "leblancslidereturnm", RE = "LeblancSoulShackleM"},
		BlindMonk  = {Q = "BlindMonkQOne", Q2 = "blindmonkqtwo", W = "BlindMonkWOne", W2 = "blindmonkwtwo", E = "BlindMonkEOne", E2 = "blindmonketwo", R = "BlindMonkRKick"},
		Leona      = {Q = "LeonaShieldOfDaybreakAttack", W = "LeonaSolarBarrier", E = "LeonaZenithBlade", R = "LeonaSolarFlare"},
		Lissandra  = {Q = "LissandraQ", W = "LissandraW", E = "LissandraE" , R = "LissandraR"},
		Lucian     = {Q = "LucianQ", W = "LucianW", E = "LucianE" , R = "LucianR"},
		Lulu       = {Q = "LuluQ", W = "LuluW", E = "LuluE" , R = "LuluR"},
		Lux        = {Q = "LuxLightBinding", W = "LuxPrismaticWave", ECast = "LuxLightStrikeKugel", EBlast = "luxlightstriketoggle" , R = "LuxMaliceCannon"},
		Malphite   = {Q = "SeismicShard", W = "Obduracy", E = "Landslide" , R = "UFSlash"},
		Malzahar   = {Q = "ALZaharCalloftheVoid", W = "ALZaharNullZone", E = "ALZaharMaleficVisions" , R = "ALZaharNetherGrasp"},
		Maokai     = {Q = "MaokiaTrunkLine", W = "MaokaiUnstableGrowth", E = "MaoKaiSapling2" , R = "MaokaiDrain3"},
		MasterYi   = {Q = "AlphaStrike", W = "Meditate", E = "WujuStyle" , R = "Highlander"},
		MissFortune = {Q = "MissFortuneRicohetShot", W = "MissFortuneViciousStrikes", E = "MissFortuneScattershot" , R = "MissFortuneBulletTime"},
		Mordekaiser = {Q = "MordekaiserMaceOfSpades", W = "MordekaiserCreepingDeathCast", E = "MordekaiserSyphonOfDestruction" , R = "MordekaiserChildrenOfTheGrave"},
		Morgana    = {Q = "DarkBindingMissile", W = "TormentedSoil", E = "BlackShield" , R = "SoulShackles"},
		Nami       = {Q = "NamiQMissile", WontoAlly = "NamiWAlly", WontoEnemy = "NamiWEnemy", E = "NamiE" , R = "NamiR"},
		Nasus      = {Q = "NasusQAttack", W = "NasusW", E = "NasusE" , R = "NasusR"},
		Nautilus   = {Q = "NautilusAnchorDragMissile", W = "NautilusPiercingGaze", E = "NautilusSplashZone" , R = "NautilusGrandLine"},
		Nidalee    = {Q = "JavelinToss", QCat = "NidaleeTakedownAttack", W = "Bushwhack", WCat = "Pounce", E = "PrimalSurge", ECat = "Swipe", R = "AspectOfTheCougar"},
		Nocturne   = {Q = "NocturneDuskbringer", W = "NocturneShroudofDarkness", E = "NocturneUnspeakableHorror" , R = "NocturneParanoia"},
		Nunu       = {Q = "Consume", W = "BloodBoil", E = "IceBlast" , R = "AbsoluteZero"},
		Olaf       = {Q = "OlafAxeThrowCast", W = "OlafFrenziedStrikes", E = "OlafRecklessStrike" , R = "OlafRagnarok"},
		Orianna    = {Q = "OrianaIzunaCommand", W = "OrianaDissonanceCommand", E = "OrianaRedactCommand" , R = "OrianaDetonateCommand"},
		Pantheon   = {Q = "PantheonQ", W = "PantheonW", E = "PantheonEChannel" , R = "PantheonRFall"},
		Poppy      = {Q = "PoppyDevastingBlow", W = "PoppyParagonOfDemacia", E = "PoppyHeroicCharge" , R = "PoppyDiplomaticImmunity"},
		Quinn      = {Q = "QuinnQ", QValor = "QuinnValorQ", W = "QuinnW", E = "QuinnE", EValor = "QuinnValorE" , R = "QuinnR", RValor = "QuinnRFinale"},
		Rammus     = {Q = "PowerBall", W = "DefensiveBallCurl", E = "PuncturingTaunt" , R = "Tremors2"},
		Reksai     = {Q = "ReksaiQ", Q2 = "reksaiqburrowed", W = "ReksaiW", W2 = "reksaiwburrowed", E = "ReksaiE", E2 = "reksaieburrowed", R = "ReksaiR"},
		Renekton   = {Q = "RenektonCleave", W = "RenektionPreExecute", E = "RenektonSliceAndDice" , R = "RenektonReignOfTheTyrant"},
		Rengar     = {Q = "RengarQ", W = "RengarW", E = "RengarE", E2 = "RengarEFinal", E3 = "RengarFinalMAX", R = "RengarR"},
		Riven      = {Q = "RivenTriCleave", W = "RivenMartyr", E = "RivenFeint" , R = "RivenFengShuiEngine", R2 = "rivenizunablade"},
		Rumble     = {Q = "RumbleFlameThrower", W = "RumbleShield", E = "RumbleGrenade" , RCast = "RumbleCarpetBomb", R2 = "RumbleCarpetBombMissile", R3 = "RumbleCarpetBombDummy"},
		Ryze       = {Q = "RyzeQ", W = "RyzeW", E = "RyzeE" , R = "RyzeR"},
		Sejuani    = {Q = "SejuaniArcticAssault", W = "SejuaniNorthernWinds", E = "SejuaniWintersClaw" , R = "SejuaniGlacialPrisonStart"},
		Shaco      = {Q = "Deceive", W = "JackInTheBox", E = "TwoShivPoison" , RCast = "HallucinateFull", RGuide = "Hallucinateguide"},
		Shen       = {Q = "ShenVorpalStar", W = "ShenFeint", E = "ShenShadowDash" , R = "ShenStandUnited"},
		Shyvana    = {Q = "ShyvanaDoubleAttack", W = "ShyvanaImmolationAura", E = "ShyvanaFireBall" , R = "ShyvanaTransformCast", R2 = "ShyvanaTransformLeap"},
		Singed     = {Q = "PoisonTrail", W = "MegaAdhesive", E = "Fling" , R = "InsanityPotion"},
		Sion       = {Q = "SionQ", W = "SionW", E = "SionE" , R = "SionR"},
		Sivir      = {Q = "SivirQ", W = "SivirW", E = "SivirE" , R = "SivirR"},
		Skarner    = {Q = "SkarnerVirulentSlash", W = "SkarnerExoskeleton", E = "SkarnerFracture" , R = "SkarnerImpale"},
		Sona       = {Q = "SonaQ", W = "SonaW", E = "SonaE" , R = "SonaR"},
		Soraka     = {Q = "SorakaQ", W = "SorakaW", E = "SorakaE" , R = "SorakaR"},
		Swain      = {Q = "SwainDecrepify", W = "SwainShadowGrasp", E = "SwainTorment" , R = "SwainMetamorphism"},
		Syndra     = {Q = "SyndraQ", W = "SyndraW", E = "SyndraE" , R = "SyndraR"},
		TahmKench  = {Q = "TahmKenchQ", W = "TahmKenchW", E = "TahmKenchE" , R = "TahmKenchR"},
		Talon      = {Q = "TalonNoxianDiplomacyAttack", WCast = "TalonRakeMissileOne", WReturn = "TalonRakeMissileTwo", E = "TalonCuttthroat" , R = "TalonShadowAssault"},
		Taric      = {Q = "Imbue", W = "Shatter", E = "Dazzle" , R = "TaricHammerSmash"},
		Teemo      = {Q = "BlindingDart", W = "MoveQuick", E = "ToxicShot" , R = "BantamTrap"},
		Thresh     = {Q = "ThreshQ", W = "ThreshW", E = "ThreshE" , R = "ThreshRPenta"},
		Tristana   = {Q = "TristanaQ", W = "TristanaW", E = "TristanaE" , R = "TristanaR"},
		Trundle    = {Q = "TrundleTrollSmash", W = "trundledesecrate", E = "TrundleCircle" , R = "TrundlePain"},
		Tryndamere = {Q = "Bloodlust", W = "MockingShout", E = "Slash" , R = "UndyingRage"},
		TwistedFate = {Q = "WildCards", W = "PickACard", E = "CardmasterStack" , R = "Destiny"},
		Twitch     = {Q = "TwitchHideInShadows", W = "TwitchVenomCaskMissile", E = "TwitchEParticle" , R = "TwitchSprayandPrayAttack"},
		Udyr       = {Q = "UdyrTigerStance", W = "UdyrTurtleStance", E = "UdyrBearStance" , R = "UdyrPhoenixStance"},
		Urgot      = {Q = "UrgotHeatseekingLineMissile", QAimbot = "UrgotHeatseekingHomeMissile", W = "UrgotTerrorCapacitorActive2", E = "UrgotPlasmaGrenade" , R = "UrgotSwap2"},
		Varus      = {Q = "VarusQ", W = "VarusW", E = "VarusE" , R = "VarusR"},
		Vayne      = {QCast = "VayneTumble", QAttack = "VayneTumbleAttack", QUltAttack = "VayneTumbleUltAttack", W = "VayneSilveredBolts", E = "VayneCondemnMissile", R = "VayneInquisition"},
		Veigar     = {Q = "VeigarBalefulStrike", W = "VeigarDarkMatter", E = "VeigarEventHorizon" , R = "VeigarPrimordialBlast"},
		Velkoz     = {Q = "VelkozQ", W = "VelkozW", E = "VelkozE" , R = "VelkozR"},
		Vi         = {Q = "ViQMissile", W = "ViW", E = "ViEAttack" , R = "ViRDunk"},
		Viktor     = {Q = "ViktorPowerTransfer", W = "ViktorGravitonField", E = "ViktorDeathRay" , R = "ViktorChaosStorm"},
		Vladimir   = {Q = "VladimirTransfusion", W = "VladimirSanguinePool", E = "VladimirTidesofBlood" , R = "VladimirHemoplague"},
		Volibear   = {Q = "VolibearQ", W = "VolibearW", E = "VolibearE" , R = "VolibearR"},
		Warwick    = {Q = "HungeringStrike", W = "HuntersCall", E = "BloodScent" , R = "infiniteduresschannel"},
		Wukong     = {Q = "MonkeyKingQAttack", W = "MonkeyKingDecoy", E = "MonkeyKingNimbus" , R = "MonkeyKingSpinToWin"},
		Xerath     = {Q = "XerathArcanopulse2", W = "XerathArcaneBarrage2", E = "XerathMageSpearMissile" , R = "XerathLocusPulse"},
		XinZhao    = {QKnockup = "XenZhaoThrust3", W = "XenZhaoBattleCry", E = "XenZhaoSweep" , R = "XenZhaoParry"},
		Yasuo      = {Q = "yasuoq", Q2 = "yasuoq2", Q3 = "yasuoq3" , W = "YasuoWMovingWall", E = "YasuoDashWrapper" , R = "YasuoRKnockUpComboW"},
		Yorick     = {Q = "YorickSpectral", W = "YorickDecayed", E = "YorickRavenous" , R = "YorickReviveAlly"},
		Zac        = {Q = "ZacQ", W = "ZacW", E = "ZacE" , R = "ZacR"},
		Zed        = {Q = "ZedShuriken", W = "ZedShadowDash", W2 = "zedw2", E = "ZedPBAOEDummy" , R = "zedult", R2 = "ZedR2"},
		Ziggs      = {QCast = "ZiggsQ", QBounce = "ZiggsQSpell", QBounce2 = "ZiggsQSpell2", QBounce3 = "ZiggsSpell3", W = "ZiggsW", ECast = "ZiggsE", E2 = "ZiggsE2", E3 = "ZiggsE3" , RCast = "ZiggsR", RBlast = "ZiggsRBoom"},
		Zilean     = {Q = "ZileanQ", W = "rewind", E = "TimeWarp" , R = "ChronoShift"},
		Zyra       = {Q = "ZyraQFissure", W = "ZyraSeed", E = "ZyraGraspingRoots" , R = "ZyraBrambleZone"},
		}
--loading the class for own champ
	if _G[myHero.charName] then
		_G[myHero.charName]()
	end
end



------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------ANNIE-------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------


--Annie Class (duh)
class "Annie"
function Annie:__init()
	--OnTick with another name
	AddTickCallback(function() self:Tick() end)
	-- see above
	AddDrawCallback(function() self:Draw() end)
	-- see draw
	AddProcessSpellCallback(function(unit, spell) self:ProcessSpell(unit, spell) end)
	AddApplyBuffCallback(function(unit, target, buff) self:ApplyBuff(unit, target, buff) end)
	AddUpdateBuffCallback(function(unit, buff, stacks) self:UpdateBuff(unit, buff, stacks) end)
	AddRemoveBuffCallback(function(unit, buff) self:RemoveBuff(unit, buff) end)
		--Targetselector for Q W
		self.dts = TargetSelector(TARGET_LESS_CAST, 625, DAMAGE_MAGIC)
		--Targetselector for R, because higher range of R
		self.rts = TargetSelector(TARGET_LESS_CAST, 750, DAMAGE_MAGIC)
		
		--Spellvalues
		self.spellData = 
			{
			[_Q] = {dmg = function () return 45 + 35*myHero:GetSpellData(_Q).level + 0.8*myHero.ap end, range = 625, mana = function () return 55 + 5*myHero:GetSpellData(_Q).level end},
			[_W] = {dmg = function () return 25 + 45*myHero:GetSpellData(_W).level + 0.85*myHero.ap end , range = 625, mana = function () return 60 + 10*myHero:GetSpellData(_W).level end},
			[_E] = {dmg = function () return 10 + 10*myHero:GetSpellData(_E).level + 0.2*myHero.ap end , mana = 20 },
			[_R] = {dmg = function () return 50 + 125*myHero:GetSpellData(_R).level + 0.8*myHero.ap end, range = 600, radius = 250, mana = 100 },
			}

		--Menu
		self.Config = scriptConfig("Annie", "PlatyAnnie")
			self.Config:addSubMenu("Combo","Combo")
				self.Config.Combo:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
				self.Config.Combo:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
				self.Config.Combo:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
				self.Config.Combo:addParam("Rmode", "R Mode", SCRIPT_PARAM_LIST, 3, {"Always", "Smart", "Stun", "Killable", "Never"})
				self.Config.Combo:addParam("HitChance", "R HitChance", SCRIPT_PARAM_SLICE, 1.5, 0, 3, 1)
			self.Config:addSubMenu("Harass","Harass")
				self.Config.Harass:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
				self.Config.Harass:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
				self.Config.Harass:addParam("ManaQ", "Min. Mana for Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
				self.Config.Harass:addParam("ManaW", "Min. Mana for W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
			self.Config:addSubMenu("LastHit","LastHit")
				self.Config.LastHit:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
				self.Config.LastHit:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, false)
				self.Config.LastHit:addParam("Lsstun", "Lasthit with Stun up", SCRIPT_PARAM_ONOFF, false)
				self.Config.LastHit:addParam("ManaQ", "Min. Mana for Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
				self.Config.LastHit:addParam("ManaW", "Min. Mana for W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
			self.Config:addSubMenu("LaneClear","LaneClear")
				self.Config.LaneClear:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
				self.Config.LaneClear:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
				self.Config.LaneClear:addParam("Lcstun", "LaneClear with Stun up", SCRIPT_PARAM_ONOFF, true)
				self.Config.LaneClear:addParam("ManaQ", "Min. Mana for Q", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
				self.Config.LaneClear:addParam("ManaW", "Min. Mana for W", SCRIPT_PARAM_SLICE, 50, 0, 100, 0)
			self.Config:addSubMenu("Killsteal","Killsteal")
				self.Config.Killsteal:addParam("KS", "Killsteal?", SCRIPT_PARAM_ONOFF, true)
				self.Config.Killsteal:addParam("Q", "Use Q", SCRIPT_PARAM_ONOFF, true)
				self.Config.Killsteal:addParam("W", "Use W", SCRIPT_PARAM_ONOFF, true)
				self.Config.Killsteal:addParam("R", "Use R", SCRIPT_PARAM_ONOFF, true)
				self.Config.Killsteal:addParam("I", "Use Ignite - Not working", SCRIPT_PARAM_ONOFF, true)
			self.Config:addSubMenu("Misc","Misc")
				self.Config.Misc:addParam("E", "Use E for Stacking", SCRIPT_PARAM_ONOFF, true)
				self.Config.Misc:addParam("R", "AutoUlt?", SCRIPT_PARAM_LIST, 2, {"Yes", "Stun", "No"})
				self.Config.Misc:addParam("Rnumber", "Number of enemies", SCRIPT_PARAM_SLICE, 3, 1, 5, 0)
			self.Config:addSubMenu("Draws","Draws")
				self.Config.Draws:addParam("Q", "Draw Q", SCRIPT_PARAM_ONOFF, true)
				self.Config.Draws:addParam("W", "Draw W", SCRIPT_PARAM_ONOFF, true)
				self.Config.Draws:addParam("R", "Draw R", SCRIPT_PARAM_ONOFF, true)
				self.Config.Draws:addParam("Qc", "Q Color", SCRIPT_PARAM_COLOR, {180, 255, 255, 255})
				self.Config.Draws:addParam("Wc", "W Color", SCRIPT_PARAM_COLOR, {180, 255, 255, 255})
				self.Config.Draws:addParam("Rc", "R Color", SCRIPT_PARAM_COLOR, {180, 255, 255, 255})
			self.Config:addSubMenu("Keys", "Keys")
				self.Config.Keys:addDynamicParam("Combo", "Combo", SCRIPT_PARAM_ONKEYDOWN, false, 32)
			    self.Config.Keys:addDynamicParam("Harass", "Harass", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("N"))
			    self.Config.Keys:addDynamicParam("LastHit", "Last hit", SCRIPT_PARAM_ONKEYDOWN, false, 188)
			    self.Config.Keys:addDynamicParam("LaneClear", "Lane Clear", SCRIPT_PARAM_ONKEYDOWN, false, string.byte("M"))
			self.Config:addSubMenu("AutoCast", "AutoCast")
				--AutoCast loop for menu
				str = {[_Q] = "Q", [_W] = "W", [_E] = "E", [_R] = "R"}
			   	for i = 0,3 do
			   		self.Config.AutoCast:addSubMenu("Cast "..str[i].." on", str[i])
			   		for _,neger in pairs(GetEnemyHeroes()) do
			   			if spellNames[neger.charName] then
			   				for slot,name in pairs(spellNames[neger.charName]) do
			   					self.Config.AutoCast[str[i]]:addParam(name,neger.charName.." "..slot, SCRIPT_PARAM_ONOFF, false)
			   				end
			   			end
			   		end
			   	end
		-- Adding UPL to the menu
		UPL:AddToMenu(self.Config)
		-- Add R to UPL
		UPL:AddSpell(_R, {speed = math.huge, delay = 0.3, range = 600, width = 225, collision = false, aoe = true, type = "circular" })
		-- Checking if summoner has ignite, not done yet > returns number with slot
		local ignite = nil
		if myHero:GetSpellData(SUMMONER_1).name:find("summonerdot") then
			ignite = SUMMONER_1
		elseif myHero:GetSpellData(SUMMONER_2).name:find("summonerdot") then
			ignite = SUMMONER_2
		end
		-- miniomanager for LastHit/Lanclear (team, range, source, sorting)
		self.mobs =  minionManager(MINION_ENEMY, 625, myHero, MINION_SORT_HEALTH_ASC)
		-- check if orbwaler is loaded, if not, load SxOrb
		if _G.Reborn_Loaded or _G.AutoCarry then
			print("PlatyAIO: SAC Found")
	    elseif _G.MMA_Loaded then
	    	print("PlatyAIO: MMA Found")
	    elseif _G.NebelwolfisOrbWalkerInit or _G.NebelwolfisOrbWalkerLoaded then
	    	print("PlatyAIO: NOW Found")
	    else 
	    	require "SxOrbwalk"
     		SxOrb:LoadToMenu(self.Config.Orbwalker)
     	end
end

function Annie:Tick()
	self:Checks()
	if self.Config.Keys.Combo then
		self:Combo()
	end
	if self.Config.Keys.Harass then
		self:Harass()
	end
	if self.Config.Keys.LastHit then
		self:LastHit()
	end
	if self.Config.Misc.R ~= 3 then
		self:AutoUlt()
	end
	if self.Config.Killsteal.KS then
		self:Killsteal()
	end
	if self.Config.Misc.E then
		self:StackE()
	end
end

function Annie:Draw()
	self:Draws()
end

-- if spellname in spellNameTable is found, check menu if its ticked, cast corresponding spell
function Annie:ProcessSpell(unit, spell)

	if unit and spell then
		for i = 0,3 do
			if self.Config.AutoCast[str[i]][spell.name] then
				if i == 0 then
					self:CastQ(unit)
				elseif i == 1 then
					self:CastW(unit)
				elseif i == 2 then
					self:CastE()
				elseif i == 3 then
					self:CastR(unit)
				end
			end
		end
	end
end

function Annie:Checks()
	-- updating both targetselectors each tick
	self.dts:update()
	self.rts:update()
	-- heros mana%, used for mana checks for Harass, LastHit, Laneclear
	self.manapc = (myHero.mana/myHero.maxMana)*100
	-- Are my spells ready?
  	self.QREADY = myHero:CanUseSpell(_Q) == READY
  	self.WREADY = myHero:CanUseSpell(_W) == READY
  	self.EREADY = myHero:CanUseSpell(_E) == READY
  	-- Annie R still returns as ready, even though its not the brust part, hence the spellname check
  	self.RREADY = myHero:CanUseSpell(_R) == READY and myHero:GetSpellData(_R).name ~= "infernalguardianguide"
  	-- Ignite ready? Soon™
  	self.IREADY = (ignite ~= nil and myHero:CanUseSpell(ignite) == READY)
end

-- Passive management
function Annie:ApplyBuff(unit, target, buff)
	if unit and unit.isMe and buff and buff.name == "pyromania_particle" then
		self.StunUP = true
	end
end

function Annie:UpdateBuff(unit, buff, stacks)
	if unit and unit.isMe and buff and buff.name == "pyromania" then
		passiveStacks = stacks
	end
end

function Annie:RemoveBuff(unit, buff)
	if unit and unit.isMe and buff and buff.name == "pyromania" then
		passiveStacks = 0
	end
	if unit and unit.isMe and buff and buff.name == "pyromania_particle" then
		self.StunUP = false 
	end
end

--Draws with values from color table - see line 219
function Annie:Draws()
	if self.QREADY and self.Config.Draws.Q then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, 625, 1, ARGB(self.Config.Draws.Qc[1],self.Config.Draws.Qc[2],self.Config.Draws.Qc[3],self.Config.Draws.Qc[4]), 32)
	end
	if self.WREADY and self.Config.Draws.W then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, 625, 1, ARGB(self.Config.Draws.Wc[1],self.Config.Draws.Wc[2],self.Config.Draws.Wc[3],self.Config.Draws.Wc[4]), 32)
	end
	if self.RREADY and self.Config.Draws.R then
		DrawCircle3D(myHero.x, myHero.y, myHero.z, 600, 1, ARGB(self.Config.Draws.Rc[1],self.Config.Draws.Wc[2],self.Config.Draws.Rc[3],self.Config.Draws.Rc[4]), 32)
	end
end 

-- Spellcast functions so it looks nicer 
function Annie:CastR(unit)
	if self.RREADY and self.Config.Combo.R and ValidTarget(unit, 750) then
		local CastPosition, HitChance, HeroPosition = UPL:Predict(_R, myHero, unit)
		if HitChance >= self.Config.Combo.HitChance then
			CastSpell(_R, CastPosition.x, CastPosition.z)
		end
	end
end

function Annie:CastQ(unit)
	if self.QREADY and self.Config.Combo.Q and ValidTarget(unit, 625) then
		CastSpell(_Q, unit)
	end
end

function Annie:CastW(unit)
	if self.WREADY and self.Config.Combo.W and ValidTarget(unit, 625) then
		CastSpell(_W, unit)
	end
end

function Annie:CastE()
	if self.EREADY then
		CastSpell(_E)
	end
end

-- very complicated E logic
function Annie:StackE()
	if not StunUP then
		self:CastE()
	end
end

-- Spam everything with some R logic - depends on the mode, see line 183 - 1 = Always, 2 = "Smart" , 3 = Stun only, 4 = only KS, 5 = never
function Annie:Combo()
	if ValidTarget(self.dts.target,625) then
		if self.RREADY and self.Config.Combo.R and self.Config.Combo.Rmode == 1 then
			self:CastR(self.rts.target) end
		if self.RREADY and self.Config.Combo.R and self.Config.Combo.Rmode < 4 and self.StunUP then
			self:CastR(self.rts.target) end
		if self.WREADY and self.Config.Combo.W then
			self:CastW(self.dts.target) end
		if self.QREADY and self.Config.Combo.Q then
			self:CastQ(self.dts.target)
		end
	elseif ValidTarget(self.rts.target, 750) and self.StunUP and self.Config.Combo.Rmode ~=4 or self.Config.Combo.Rmode ~=5 then
		if self.RREADY and self.Config.Combo.R then
			self:CastR(self.rts.target)
		end
	end
end

-- Spam everything unless mana% is lower than menuslider - line 191
function Annie:Harass()
	if ValidTarget(self.dts.target, 625) then
		if self.QREADY and self.Config.Harass.Q and self.manapc > self.Config.Harass.ManaQ then
			self:CastQ(self.dts.target) end
		if self.WREADY and self.Config.Harass.W and self.manapc > self.Config.Harass.ManaW then
			self:CastW(self.dts.target)
		end
	end
end

-- tries to hit X amount of people, where X is the number returned by the menu slider - line 214
function Annie:AutoUlt()
	if not StunUP and self.Config.Misc.R == 2 then return end
	local mainCastPosition, mainHitChance, numPoints, mainPosition = UPL.VP:GetCircularAOECastPosition(unit, 0.3, 225, 600, math.huge, myHero, false)
	if numPoints > self.Config.Misc.Rnumber then
		CastSpell(_R, mainCastPosition.x, mainCastPosition.z)
	end
end

-- generic KS, loop thru all enemies, check for enough mana and health, spam, enjoy free gold
function Annie:Killsteal()
	local Qm = self.spellData[_Q].mana()
	local Wm = self.spellData[_W].mana()
	local Rm = self.spellData[_R].mana
	for i,enemy in pairs(GetEnemyHeroes()) do
		local Qdmg = myHero:CalcMagicDamage(enemy, (self.QREADY and myHero.mana > Qm) and self.spellData[_Q].dmg() or 0)
		local Wdmg = myHero:CalcMagicDamage(enemy, (self.WREADY and myHero.mana > Wm) and self.spellData[_W].dmg() or 0)
		local Rdmg = myHero:CalcMagicDamage(enemy, (self.RREADY and myHero.mana > Rm and myHero:GetSpellData(_R).name == "InfernalGuardian") and self.spellData[_R].dmg() or 0)
		if self.Config.Killsteal.KS then
			if ValidTarget(enemy, 625) then
				if Qdmg > enemy.health and self.Config.Killsteal.Q then
					self:CastQ(enemy)
				elseif Wdmg > enemy.health and self.Config.Killsteal.W then
					self:CastW(enemy)
				elseif Rdmg > enemy.health and self.Config.Killsteal.R then
					self:CastR(enemy)
				elseif (Qdmg + Wdmg) > enemy.health and self.Config.Killsteal.Q and self.Config.Killsteal.W and (Qm+Wm) < myHero.mana then
					self:CastW(enemy) DelayAction(function() self:CastQ(enemy) end, 0.25)
				elseif (Qdmg + Rdmg) > enemy.health and self.Config.Killsteal.Q and self.Config.Killsteal.R and (Qm+Rm) < myHero.mana then
					self:CastQ(enemy) DelayAction(function() self:CastR(enemy) end, 0.25)
				elseif (Wdmg + Rdmg) > enemy.health and self.Config.Killsteal.W and self.Config.Killsteal.R and (Wm+Rm) < myHero.mana then
					self:CastW(enemy) DelayAction(function() self:CastR(enemy) end, 0.25)
				elseif (Qdmg + Wdmg + Rdmg) > enemy.health and self.Config.Killsteal.Q and self.Config.Killsteal.W and self.Config.Killsteal.R and (Qm+Wm+Rm) < myHero.mana then
					self:CastW(enemy) DelayAction(function() self:CastQ(enemy) DelayAction(function() self:CastR(enemy) end, 0.25)end, 0.25)
				end
			elseif ValidTarget(enemy,800) and Rdmg > enemy.health and self.Config.Killsteal.R then
				self:CastR(enemy)
			end
		end
	end
end

-- LastHit with Q and W, W is off by default, also checks for mana%
function Annie:LastHit()
	if self.Config.LastHit.Q and self.manapc > self.Config.LastHit.ManaQ then
		-- if StunUP and if "allowed to cast with stun" is ticked
		if StunUP and not self.Config.LastHit.Lsstun then return end
		self:QFarm()
	end
	if self.Config.LastHit.W and self.manapc > self.Config.LastHit.ManaW then
		if StunUP and not self.Config.LastHit.Lsstun then return end
		self:WFarm()
	end
end

function Annie:LaneClear()
	if self.Config.LaneClear.Q and self.manapc > self.Config.LaneClear.ManaQ then
		if self.StunUP and not self.Config.LaneClear.Lcstun then return end
		self:QFarm()
	end
	if self.Config.LaneClear.W and self.manapc > self.Config.LaneClear.ManaW then
		if self.StunUP and not self.Config.LastHit.Lcstun then return end
		self:WClear()
	end
end


function Annie:QFarm()
	-- update minionmanager, which we made in line 252
	self.mobs:update()
	-- is Q ticked in the LastHit menu?
	if self.Config.LastHit.Q then
		-- loop thru all minions in our minionmanager
		for _, minion in pairs(self.mobs.objects) do
		-- variable for current mana
		local Qm = self.spellData[_Q].mana()
		-- variable for Q damage - If its ready and we have enough mana, return Dmg, else 0
		local Qdmg = (self.QREADY and myHero.mana > Qm) and self.spellData[_Q].dmg() or 0
		-- minion hp prediction <3 HTTF
		local hp = UPL.HP:PredictHealth(minion, GetDistance(minion)/2000 + 0.250)
		-- if Qdmg is higher than predicted HP, fire Q
			if Qdmg > hp then
				self:CastQ(minion)
			end
		end
	end
end
--look at QFarm() same stuff
function Annie:WFarm()
	self.mobs:update()
	if self.Config.LastHit.W then
		for _, minion in pairs(self.mobs.objects) do
		local Wm = self.spellData[_W].mana()
		local Wdmg = (self.QREADY and myHero.mana > Wm) and self.spellData[_W].dmg() or 0
		local hp = UPL.HP:PredictHealth(minion, GetDistance(minion)/2000 + 0.250)
			if Wdmg > hp then
				self:CastW(minion)
			end
		end
	end
end

-- much logic, Developer inc. If this doenst work very well Ill try finding something else 
function Annie:WClear()
	self.mobs:update()
	if self.Config.LastHit.W then
		for _, minion in pairs(self.mobs.objects) do
				self:CastW(minion)
		end
	end
end