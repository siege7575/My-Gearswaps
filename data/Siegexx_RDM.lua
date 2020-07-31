-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Motenten's Macro Book Function ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Magic. Default ACC Set Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	StunIndex = 0
	Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	LowNuke = 'ON' -- Set Default Low Tier Nuke ON or OFF Here --
	MB = 'OFF' -- Set Default MB ON or OFF Here --
	Elemental_Staff = 'OFF' -- Set Default Precast Elemental Staff ON or OFF Here --
	Enspells = 'OFF' -- Set Default Enspells ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Low_Tier_Spells = S{
			'Fire','Aero','Water','Blizzard','Stone','Thunder','Fire II','Aero II','Water II',
			'Blizzard II','Stone II','Thunder II'}

	Non_Obi_Spells = S{
			'Burn','Choke','Drown','Frost','Rasp','Shock','Impact','Anemohelix','Cryohelix',
			'Geohelix','Hydrohelix','Ionohelix','Luminohelix','Noctohelix','Pyrohelix'}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1 = "Composure", SC2 = "Stun", SC3 = "Chainspell"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Idle Sets --
	sets.Idle.Refresh = {
			main="Emissary",
			sub="Beatific Shield +1",
			ammo="Staunch Tathlum +1",
			head="Viti. Chapeau +2",
			neck="Loricate Torque +1",
			ear1="Etiolation Earring",
			ear2="Eabani Earring",
			body="Atrophy Tabard +3",
			hands="Malignance Gloves",
			ring1="Defending Ring",
			ring2="Dark Ring",
			back="Moonbeam Cape",
			waist="Flume Belt",
			--legs="Malignance Tights", --
			legs={ name="Chironic Hose", augments={'Pet: Haste+2','VIT+9','"Refresh"+2','Accuracy+1 Attack+1',}},
			feet={ name="Merlinic Crackows", augments={'Crit. hit damage +1%','Pet: "Dbl. Atk."+1','"Refresh"+1','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}}
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{
			--legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			})
	sets.Resting = set_combine(sets.Idle.Movement,{})

	-- PDT Set --
	sets.PDT = {}

	-- Sublimation Set --
	sets.Sublimation = {}

	sets.Precast = {}

	-- Fastcast Set (empty = To Fix Club/Staff Issue) --
	sets.Precast.FastCast = {
			head={ name="Merlinic Hood", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','"Fast Cast"+6',}},
			neck="Voltsurge Torque",
			ear1="Malignance Earring",
			ear2="Loquacious Earring",
			body="Viti. Tabard +3",
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			ring1="Prolix Ring",
			ring2="Kishar Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}}

	-- Elemental Staves --
	sets.Precast.Lightning = {main='Apamajas I'}
	sets.Precast.Water = {main='Haoma I'}
	sets.Precast.Fire = {main='Atar I'}
	sets.Precast.Ice = {main='Vourukasha I'}
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Earth = {main='Vishrava I'}
	sets.Precast.Light = {main='Arka I'}
	sets.Precast.Dark = {main='Xsaeta I'}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Precast Enfeebling Magic --
	sets.Precast['Enfeebling Magic'] = set_combine(sets.Precast.FastCast,{head="Leth. Chappel +1"})
	
	-- Precast Dispelga via Daybreak -- 
	-- sets.Precast.Dispelga = set_combine(sets.Precast.FastCast,{main="Daybreak",sub="Beatific Shield +1",head="Leth. Chappel +1"})

	-- Precast Cure Set --
	sets.Precast.Cure = {
			--main="Queller Rod",
			sub="Genbu's Shield",
			ammo="Impatiens",
			head={ name="Merlinic Hood", augments={'Mag. Acc.+13 "Mag.Atk.Bns."+13','"Fast Cast"+6',}},
			neck="Voltsurge Torque",
			ear1="Mendicant's Earring +1",
			ear2="Loquacious Earring",
			body="Viti. Tabard +3",
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}},
			ring1="Lebeche Ring",
			ring2="Kishar Ring",
			back="Swith Cape +1",
			waist="Witful Belt",
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}},
			feet="Vanya Clogs"}

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Haste Set --
	sets.Midcast.Haste = {
			main={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +10','INT+15','Mag. Acc.+25','"Mag.Atk.Bns."+7',}},
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			neck="Duelist's Torque +1",
			ear1="Malignance Earring",
			ear2="Gifted Earring",
			body="Viti. Tabard +3",
			hands="Atrophy Gloves +3",
			ring1="Kishar Ring",
			ring2="Lebeche Ring",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
			waist="Embla Sash",
			legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			feet="Leth. Houseaux +1"}

	-- Cure Set --
	sets.Midcast.Cure = {
			--main="Tamaxchi",
			--sub="Genbu's Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			neck="Incanter's Torque",
			ear1="Mendicant's Earring",
			ear2="Gifted Earring",
			body="Viti. Tabard +3",
			hands="Kaykaus Cuffs",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back="Solemnity Cape",
			waist="Austerity Belt +1",
			legs="Atrophy Tights +2",
			feet="Vanya Clogs"}

	-- Curaga Set --
	sets.Midcast.Curaga = {
			--main="Tamaxchi",
			--sub="Genbu's Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			neck="Incanter's Torque",
			ear1="Mendicant's Earring",
			ear2="Gifted Earring",
			body="Viti. Tabard +3",
			hands="Kaykaus Cuffs",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back="Solemnity Cape",
			waist="Austerity Belt +1",
			legs="Atrophy Tights +2",
			feet="Vanya Clogs"}

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = {
			main={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +10','INT+15','Mag. Acc.+25','"Mag.Atk.Bns."+7',}},
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head="Befouled Crown",
			neck="Incanter's Torque",
			ear1="Andoaa Earring",
			ear2="Gifted Earring",
			body="Viti. Tabard +3",
			hands="Viti. Gloves +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +6','Enha.mag. skill +10','Mag. Acc.+4','Enh. Mag. eff. dur. +17',}},
			waist="Olympus Sash",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Leth. Houseaux +1"}

	-- Refresh --
	sets.Midcast.Refresh = set_combine(sets.Midcast.Haste,{
			head="Amalric Coif",
			body="Atrophy Tabard +3",
			legs="Leth. Fuseau +1"})

	-- Enspell --
	sets.Midcast.Enspell = set_combine(sets.Midcast['Enhancing Magic'],{
			hands="Aya. Manopolas +1"})
			
	-- Gain --
	sets.Midcast.Gain = set_combine(sets.Midcast['Enhancing Magic'],{
		hands="Viti. Gloves +2"})
	
	-- Dia TH Set --
	sets.Midcast.Dia = set_combine(sets.Midcast['Enfeebling Magic'],{
			head="Viti. Chapeau +2",
			waist={ name="Chaac Belt", augments={'"Treasure Hunter"+1','MND+2','HP+9',}},
			legs={ name="Chironic Hose", augments={'DEX+3','Mag. Acc.+1','"Treasure Hunter"+1','Accuracy+18 Attack+18','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
			feet={ name="Chironic Slippers", augments={'VIT+14','Rng.Acc.+15','"Treasure Hunter"+2','Accuracy+8 Attack+8',}}})

	-- Composure(Enhancing Magic On Others) Set --	
	sets.Composure = {
			main={ name="Grioavolr", augments={'Enh. Mag. eff. dur. +10','INT+15','Mag. Acc.+25','"Mag.Atk.Bns."+7',}},
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			neck="Duelist's Torque +1",
			ear1="Malignance Earring",
			ear2="Gifted Earring",
			body="Viti. Tabard +3",
			hands="Atrophy Gloves +3",
			ring1="Kishar Ring",
			ring2="Lebeche Ring",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
			waist="Embla Sash",
			legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			feet="Leth. Houseaux +1"}
	
		-- Refresh on others --
	sets.Composure.Refro = { body="Atrophy Tabard +3", legs="Leth. Fuseau +1",}

	-- Stoneskin --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{waist="Siegel Sash",neck="Noden's Gorget"})

	-- Phalanx --
	sets.Midcast.Phalanx = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Cursna --
	sets.Midcast.Cursna = set_combine(sets.Midcast.Haste,{
			ammo="Pemphredo Tathlum",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			neck="Debilis Medallion",
			ear2="Loquacious Earring",
			body="Zendik Robe",
			hands="Vanya Cuffs",
			ring1="Haoma's Ring",
			ring2="Haoma's Ring",
			back="Nantosuelta's Cape",
			waist="Gishdubar Sash",
			legs="Lengo Pants"})

	-- Stun Sets --
	sets.Midcast.Stun = {}
	sets.Midcast.Stun.MidACC = set_combine(sets.Midcast.Stun,{})
	sets.Midcast.Stun.HighACC = set_combine(sets.Midcast.Stun.MidACC,{})

	-- Dark Magic Sets --
	sets.Midcast['Dark Magic'] = {
			main={ name="Rubicundity", augments={'Mag. Acc.+7','"Mag.Atk.Bns."+7','Dark magic skill +6','"Conserve MP"+4',}},
			sub="Genbu's Shield",
			head="Amalric Coif",
			neck="Erra Pendant",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body="Geomancy Tunic +3",
			hands="Jhakri Cuffs +1",
			ring1="Evanescence Ring",
			ring2="Archon Ring",
			back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Fucho-no-obi",
			legs="Merlinic Shalwar",
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+5','Mag. Acc.+14','"Mag.Atk.Bns."+8',}}}
	sets.Midcast['Dark Magic'].MidACC = set_combine(sets.Midcast['Dark Magic'],{})
	sets.Midcast['Dark Magic'].HighACC = set_combine(sets.Midcast['Dark Magic'].MidACC,{})

	-- Low Tier Set --
	sets.LowNuke = {
			main={ name="Grioavolr", augments={'Enfb.mag. skill +12','MND+5','Mag. Acc.+28','"Mag.Atk.Bns."+30',}},
			sub="Niobid Strap",
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','INT+10','Mag. Acc.+12','"Mag.Atk.Bns."+9',}},
			hands={ name="Chironic Gloves", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +1','MND+4','"Mag.Atk.Bns."+11',}},
			ring1="Freke Ring",
			ring2="Shiva Ring +1",
			back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Eschan Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst mdg.+1%','Mag. Acc.+12',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+5','Mag. Acc.+14','"Mag.Atk.Bns."+8',}}}

	-- MB Set --
	sets.MB = {
			main={ name="Grioavolr", augments={'Magic burst dmg.+5%','MP+18','Mag. Acc.+30','"Mag.Atk.Bns."+25',}},
			sub="Niobid Strap",
			ammo="Pemphredo Tathlum",
			head="Ea Hat",
			neck="Mizu. Kubikazari",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body="Ea Houppelande",
			hands="Ea Cuffs",
			ring1="Freke Ring",
			ring2="Shiva Ring +1",
			back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Hachirin-no-Obi",
			legs="Ea Slops",
			feet="Jhakri Pigaches +2"}

	-- Elemental Sets --
	sets.Midcast['Elemental Magic'] = {
			main={ name="Grioavolr", augments={'Magic burst dmg.+5%','MP+18','Mag. Acc.+30','"Mag.Atk.Bns."+25',}},
			sub="Niobid Strap",
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body={ name="Merlinic Jubbah", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','INT+10','Mag. Acc.+12','"Mag.Atk.Bns."+9',}},
			hands={ name="Chironic Gloves", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +1','MND+4','"Mag.Atk.Bns."+11',}},
			ring1="Freke Ring",
			ring2="Shiva Ring +1",
			back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}},
			waist="Eschan Stone",
			legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst mdg.+1%','Mag. Acc.+12',}},
			feet={ name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','CHR+5','Mag. Acc.+14','"Mag.Atk.Bns."+8',}}}
	sets.Midcast['Elemental Magic'].MidACC = set_combine(sets.Midcast['Elemental Magic'],{})
	sets.Midcast['Elemental Magic'].HighACC = set_combine(sets.Midcast['Elemental Magic'].MidACC,{})

	-- Enfeebling Sets --
	sets.Midcast['Enfeebling Magic'] = {
			main={ name="Grioavolr", augments={'Enfb.mag. skill +12','MND+5','Mag. Acc.+28','"Mag.Atk.Bns."+30',}},
			sub="Enki Strap",
			ammo="Regal Gem",
			head="Viti. Chapeau +2",
			neck="Duelist's Torque +1",
			ear1="Snotra Earring",
			ear2="Regal Earring",
			body="Atrophy Tabard +3", --Lethargy Sayon +1--
			hands="Kaykaus Cuffs +1",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
			waist="Luminary Sash",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','MND+13','Mag. Acc.+11','"Mag.Atk.Bns."+10',}},
			feet="Vitiation Boots +3"}
	sets.Midcast['Enfeebling Magic'].MidACC =  set_combine(sets.Midcast['Enfeebling Magic'],{})
	sets.Midcast['Enfeebling Magic'].HighACC = set_combine(sets.Midcast['Enfeebling Magic'].MidACC,{})
	
	-- Magic Accuracy --
	sets.Midcast.Macc = set_combine(sets.Midcast['Enfeebling Magic'],{})
	
	sets.Midcast.Saboteurcast = set_combine(sets.Midcast['Enfeebling Magic'],{hands="Leth. Gantherots +1"})
	
	sets.Midcast.Dispelga = set_combine(sets.Midcast['Enfeebling Magic'],{main="Daybreak",sub="Beatific Shield +1"})

	-- Impact --
	sets.Midcast.Impact = {
			body="Twilight Cloak"}

	-- Elemental Obi/Twilight Cape --
	sets.Obi = {}
	sets.Obi.Lightning = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Water = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Light = {back="Twilight Cape",waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {back="Twilight Cape",waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Chainspell = {body="Viti. Tabard +3"}
	--sets.JA.Saboteur = {hands="Leth. Gantherots +1"}

	-- Melee Sets --
	sets.Melee = {
			main="Naegling",
			sub="Beatific Shield +1",
			ammo="Ginsen",
			head="Malignance Chapeau",
			neck="Anu Torque",
			ear1="Sherida Earring",
			ear2="Telos Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Hetairoi Ring",
			ring2="Ilabrat Ring",
			back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
			waist="Reiki Yotai",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}}
	sets.Melee.MidACC = set_combine(sets.Melee,{
			head="Aya. Zucchetto +1",
			hands={ name="Chironic Gloves", augments={'Accuracy+22','"Dual Wield"+5',}}})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{
			head="Carmine Mask +1",
			hands={ name="Chironic Gloves", augments={'Accuracy+22','"Dual Wield"+5',}}})

	-- WS Base Set --
	sets.WS = {
			ammo="Ginsen",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Sherida Earring",
			body="Ayanmo Corazza +2",
			hands="Jhakri Cuffs +1",
			ring1="Ilabrat Ring",
			ring2="Apate Ring",
			back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
			
	sets.WS["Savage Blade"] = {
			ammo="Regal Gem",
			head="Viti. Chapeau +2",
			neck="Caro Necklace",
			ear1="Moonshade Earring",
			ear2="Regal Earring",
			body="Viti. Tabard +3",
			hands="Jhakri Cuffs +2",
			ring1="Rufescent Ring",
			ring2="Stikini Ring +1",
			back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Jhakri Slops +2",
			feet="Carmine Greaves +1"}	

	-- Chant du Cygne Sets --
	sets.WS["Chant du Cygne"] = {
			ammo="Yetshila +1",
			head={ name="Taeon Chapeau", augments={'Accuracy+16 Attack+16','"Triple Atk."+2','DEX+10',}},
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Mache Earring +1",
			body="Ayanmo Corazza +2",
			hands="Jhakri Cuffs +2",
			ring1="Begrudging Ring",
			ring2="Ilabrat Ring",
			back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
			feet="Thereoid Greaves"}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{})

	-- Death Blossom Sets --
	sets.WS["Death Blossom"] = {
			ammo="Ginsen",
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Sherida Earring",
			body="Ayanmo Corazza +2",
			hands="Jhakri Cuffs +1",
			ring1="Begrudging Ring",
			ring2="Rufescent Ring",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS["Death Blossom"].MidACC = set_combine(sets.WS["Death Blossom"],{})
	sets.WS["Death Blossom"].HighACC = set_combine(sets.WS["Death Blossom"].MidACC,{})
	-- Requiescat Sets --
	sets.WS.Requiescat = {
			ammo="Regal Gem",
			head="Viti. Chapeau +2",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Sherida Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			ring1="Stikini Ring +1",
			ring2="Rufescent Ring",
			back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}},
			waist="Fotia Belt",
			legs="Jhakri Slops +2",
			feet="Jhakri Pigaches +2"}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{})

	-- Knights of Round Set --
	sets.WS["Knights of Round"] = {}

	-- Exenterator Sets --
	sets.WS.Exenterator = {}
	sets.WS.Exenterator.MidACC = set_combine(sets.WS.Exenterator,{})
	sets.WS.Exenterator.HighACC = set_combine(sets.WS.Exenterator.MidACC,{})

	-- Evisceration Sets --
	sets.WS.Evisceration = {}
	sets.WS.Evisceration.MidACC = set_combine(sets.WS.Evisceration,{})
	sets.WS.Evisceration.HighACC = set_combine(sets.WS.Evisceration.MidACC,{})

	-- Idle Reive Set --
	sets.Reive = {neck="Arciela's Grace +1"}
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.english:startswith("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:startswith("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 17+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Stun" then
				if buffactive.Composure then -- Cancel Composure When You Cast Stun --
					cast_delay(0.2)
					send_command('cancel Composure')
				end
				equip(sets.Precast.FastCast)
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif spell.english == "Dispelga" then
				equip(set_combine(sets.Precast.FastCast,{main="Daybreak",sub="Beatific Shield +1",head="Leth. Chappel +1"}))
			elseif spell.english:startswith("En") and Enspells == 'ON' then
				local list={Dark="blizzard",Water="water",Earth="stone",Ice="blizzard",Fire="fire",Wind="aero",Lightning="thunder",Light="fire"}
				if spell.english ~= 'En'..list[world.day_element]..''..(spell.english:endswith(' II') and ' II' or '') then
					cancel_spell()
					send_command('@input /ma "En'..list[world.day_element]..''..(spell.english:endswith(' II') and ' II' or '')..'" <me>')
					return
				end
			elseif spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if (spell.english == "Chant du Cygne" or spell.english == "Evisceration") and player.tp > 2990 then -- Equip Jupiter's Pearl When You Have 3000 TP --
				equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
--	if sets.Precast[spell.element] and Elemental_Staff == 'ON' then
--		equip(sets.Precast[spell.element])
--	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			if spell.english:startswith('Cure') then
				equipSet = equipSet.Cure
			elseif spell.english:startswith('Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Refresh') and  spell.target.name == player.name then
			equipSet = equipSet.Refresh
		elseif spell.english:startswith('En') then
			equipSet = equipSet.Enspell
		elseif spell.english:startswith('Gain') then
			equipSet = equipSet.Gain
		elseif spell.english:startswith('Haste') or spell.english == "Sandstorm" or spell.english == "Rainstorm" or spell.english == "Windstorm" or spell.english == "Klimaform" or
			   spell.english == "Firestorm" or spell.english == "Hailstorm" or spell.english == "Thunderstorm" or spell.english == "Voidstorm" or spell.english == "Aurorastorm" or
			   spell.english == "Aquaveil" or spell.english == "Blink" and spell.target.type ~= 'PLAYER' then
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Flurry') or spell.english:startswith('Shell') or spell.english:startswith('Protect') and spell.target.type ~= 'PLAYER' then
			equipSet = equipSet.Haste
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Phalanx II" then -- Equip Aug'd Viti. Gloves +1 When You Cast Phalanx II --
			equipSet = set_combine(equipSet,{hands="Viti. Gloves +1"})
		elseif spell.english:startswith('Dia') or spell.english == "Stonega" then -- Enfeeb set + TH --
			equipSet = equipSet.Dia
		elseif spell.english == "Dispelga" then
			equip(set_combine(sets.Midcast['Enfeebling Magic'],{main="Daybreak",sub="Beatific Shield +1"}))
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Banish') then
			equipSet = set_combine(equipSet.Haste,{ring1="Fenian Ring"})
		elseif Low_Tier_Spells:contains(spell.english) and LowNuke == 'ON' then
			equipSet = set_combine(equipSet,sets.LowNuke)
		elseif spell.skill == 'Elemental Magic' and MB == 'ON' then
			equipSet = set_combine(equipSet,sets.MB)
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7; cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
			if (spell.skill == 'Elemental Magic' or spell.english:startswith('Cur') or spell.english:startswith('Bio') or spell.english:startswith('Dia') or spell.english == 'Aspir' or spell.english == 'Drain') and not Non_Obi_Spells:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' and spell.english ~= "Cursna" then -- Use Obi Toggle To Equip Normal Waist Gear --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
	end

	if buffactive.Composure and spell.skill == "Enhancing Magic" and spell.target.name ~= player.name then -- spell.target.type == 'PLAYER' then -- Equip Composure Set When You Cast Enhancing Spells On Others --
		equipSet = set_combine(equipSet,sets.Composure)
		if spell.english:startswith('Refresh') then -- Refresh potency+ for others. --
			equipSet = set_combine(equipSet,sets.Composure.Refro)
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	if spell.skill == 'Enfeebling Magic' and buffactive.Saboteur then
		equipSet = set_combine(equipSet,sets.Midcast.Saboteurcast)	
	end
	equip(equipSet)
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.english == "Sleep II" then -- Sleep II Countdown --
			send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equipSet = sets.Melee
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
			equipSet = set_combine(equipSet,sets.Reive)
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if StunIndex == 1 then
		equip(sets.Midcast.Stun)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 150;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 15;input /echo Aftermath: Lv.3 [WEARING OFF IN 15 SEC.];wait 5;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if not midaction() then
		status_change(player.status)
	end
end

-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Stun Toggle --
		if StunIndex == 1 then
			StunIndex = 0
			add_to_chat(123,'Stun Set: [Unlocked]')
		else
			StunIndex = 1
			add_to_chat(158,'Stun Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- LowNuke Toggle --
		if LowNuke == 'ON' then
			LowNuke = 'OFF'
			add_to_chat(123,'Low Nuke: [OFF]')
		else
			LowNuke = 'ON'
			add_to_chat(158,'Low Nuke: [ON]')
		end
		status_change(player.status)
	elseif command == 'C9' then -- MB Toggle --
		if MB == 'ON' then
			MB = 'OFF'
			add_to_chat(123,'MB: [OFF]')
		else
			MB = 'ON'
			add_to_chat(158,'MB: [ON]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- Lock Main Weapon Toggle --
		if Lock_Main == 'ON' then
			Lock_Main = 'OFF'
			add_to_chat(123,'Main Weapon: [Unlocked]')
		else
			Lock_Main = 'ON'
			add_to_chat(158,'Main Weapon: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- Enspells Toggle --
		if Enspells == 'ON' then
			Enspells = 'OFF'
			add_to_chat(123,'Enspells: [OFF]')
		else
			Enspells = 'ON'
			add_to_chat(158,'Enspells: [ON]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then    -- Mecisto. Mantle commented out --
		disable('back')
	elseif Lock_Main == 'ON' then
		disable('main','sub')
	else
		enable('main','sub','ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: [Current MP = ' .. player.mp .. ' | ' .. player.mpp .. '%] Using '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book()
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WHM' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'BLM' then
		set_macro_page(2, 2)
	elseif player.sub_job == 'SCH' then
		set_macro_page(3, 2)
	elseif player.sub_job == 'DNC' then
		set_macro_page(10, 2)
	elseif player.sub_job == 'WAR' then
		set_macro_page(9, 2)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 2)
	else
		set_macro_page(1, 2)
	end
end