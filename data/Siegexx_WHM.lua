-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some Of Motenten's Functions ** --

function get_sets()
	IdleIndex = 1
	IdleArray = {"Refresh","Movement"} -- Default Idle Set Is Movement --
	Armor = 'None'
	canceled = false
	DC = false
	Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
	Enmity = 'OFF' -- Set Default Enmity Set ON or OFF Here --
	Kiting = 'ON' -- Set Default Sublimation Kiting ON or OFF Here --
	Elemental_Staff = 'OFF' -- Set Default Precast Elemental Staff ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV","Cure V","Cure VI"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II","Curaga III","Curaga IV","Curaga V"} -- Curaga Degradation --
	Na_Spells = S{"Paralyna","Silena","Poisona","Blindna","Viruna","Stona","Erase"} -- For Yagrush --
	sc_map = {SC1 = "LightArts", SC2 = "Celerity", SC3 = "Accession"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {
			main="Daybreak",
			sub="Genmei Shield",
			ammo="Staunch Tathlum +1",
			head="Inyanga Tiara +2",
			neck="Loricate Torque +1",
			ear1="Etiolation Earring",
			ear2="Eabani Earring",
			body="Theo. Briault +3",
			hands="Inyanga Dastanas +2",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Moonbeam Cape",
			waist="Carrier's Sash",
			legs="Inyanga Shalwar +2",--legs={ name="Chironic Hose", augments={'Pet: Haste+2','VIT+9','"Refresh"+2','Accuracy+1 Attack+1',}},
			feet="Inyan. Crackows +2"}
	-- Refresh Set --
	sets.Idle.Refresh = {
			main="Daybreak",
			sub="Genmei Shield",
			ammo="Staunch Tathlum +1",
			head="Inyanga Tiara +2",
			neck="Loricate Torque +1",
			ear1="Etiolation Earring",
			ear2="Eabani Earring",
			body="Theo. Briault +3",
			hands="Inyanga Dastanas +2",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Moonbeam Cape",
			waist="Carrier's Sash",
			legs="Inyanga Shalwar +2",--legs={ name="Chironic Hose", augments={'Pet: Haste+2','VIT+9','"Refresh"+2','Accuracy+1 Attack+1',}},
			feet="Inyan. Crackows +2"}

	-- Movement Set --
	sets.Idle.Movement = set_combine(sets.Idle.Refresh,{waist="Embla Sash"})

	-- Resting Set --
	sets.Resting = {}

	-- PDT Set --
	sets.PDT = {
			main="Queller Rod",
			sub="Genmei Shield",
			ammo="Staunch Tathlum +1",
			head="Inyanga Tiara +2",
			neck="Loricate Torque +1",
			ear1="Etiolation Earring",
			ear2="Eabani Earring",
			body="Theo. Briault +3",
			hands="Inyanga Dastanas +2",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back="Moonbeam Cape",
			waist="Carrier's Sash",
			legs="Inyanga Shalwar +2",--legs={ name="Chironic Hose", augments={'Pet: Haste+2','VIT+9','"Refresh"+2','Accuracy+1 Attack+1',}},
			feet="Inyan. Crackows +2"}

	-- Sublimation Set --
	sets.Sublimation = set_combine(sets.Idle.Refresh,{waist="Embla Sash"})

	sets.Precast = {}
			
	-- Fastcast Set (empty = To Fix Club/Staff Issue) --
	sets.Precast.FastCast = {
			main="Queller Rod",
			sub="Genbu's Shield",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, -- 10
			neck="Cleric's Torque", -- 6
			ear1="Malignance Earring", -- 4
			ear2="Loquacious Earring", -- 2
			body="Inyanga Jubbah +1", -- 13
			hands="Fanatic Gloves", -- 5
			ring1="Prolix Ring", -- 3
			ring2="Kishar Ring", -- 4
			back="Swith Cape +1", -- 3
			waist="Embla Sash", -- 5
			legs="Lengo Pants", -- 5
			feet={ name="Telchine Pigaches", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}} -- 4

	-- Elemental Staves --
	sets.Precast.Lightning = {main='Apamajas I'}
	sets.Precast.Water = {main='Haoma I'}
	sets.Precast.Fire = {main='Atar I'}
	sets.Precast.Ice = {main='Vourukasha I'}
	sets.Precast.Wind = {main='Vayuvata I'}
	sets.Precast.Earth = {main='Vishrava I'}
	sets.Precast.Light = {main='Arka I'}
	sets.Precast.Dark = {main='Xsaeta I'}

	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	sets.Precast['Healing Magic'] = set_combine(sets.Precast.FastCast,{main="Yagrush",hands="Ebers Mitts +1",legs="Ebers Pant. +1"})

	sets.Precast.Stoneskin = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Cure Precast Set --
	sets.Precast.Cure = {
			main="Queller Rod", 
			sub="Genbu's Shield",
			ammo="Impatiens",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			neck="Cleric's Torque",
			ear1="Nourishing Earring +1",
			ear2="Malignance Earring",
			body="Inyanga Jubbah +1",
			hands="Kaykaus Cuffs",
			ring1="Kishar Ring",
			ring2="Lebeche Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Witful Belt",
			legs="Ebers Pant. +1",
			feet="Vanya Clogs"}

	-- Midcast Base Set --
	sets.Midcast = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','STR+6','Mag. Acc.+12','"Mag.Atk.Bns."+17','DMG:+5',}},
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			neck="Incanter's Torque",
			ear1="Andoaa Earring",
			ear2="Gifted Earring",
			body="Inyanga Jubbah +1",
			hands="Kaykaus Cuffs",
			ring1="Stikini Ring +1",
			ring2="Lebeche Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Austerity Belt +1",
			legs="Ebers Pant. +1",
			feet="Vanya Clogs"}

	-- Haste Set --
	sets.Midcast.Haste = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','STR+6','Mag. Acc.+12','"Mag.Atk.Bns."+17','DMG:+5',}},
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			neck="Incanter's Torque",
			ear1="Mendicant's Earring",
			ear2="Gifted Earring",
			body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			hands={ name="Telchine Gloves", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
			ring1="Lebeche Ring",
			ring2="Kishar Ring",
			back="Solemnity Cape",
			waist="Embla Sash",
			legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			feet="Theo. Duckbills +3"}
	
	-- Boost Set --
	sets.Midcast.Boost = set_combine(sets.Midcast.Haste,{
			ear1="Andoaa Earring",
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back="Mending Cape"})
	
	-- Raise / Arise / Reraise set (-Spell interrupt + Conserve MP)
	sets.Midcast.Raise = {
			main="Queller Rod",
			sub="Genmei Shield",
			ammo="Staunch Tathlum +1", -- 10 SI
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			neck="Cleric's Torque",
			ear1="Malignance Earring",
			ear2="Gifted Earring",
			body="Inyanga Jubbah +1",
			hands="Chironic Gloves", -- 20 SI
			ring1="Evanescence Ring", -- 5 SI
			ring2="Kishar Ring",
			back="Solemnity Cape",
			waist="Witful Belt",
			legs="Lengo Pants", -- 10 SI
			feet="Theo. Duckbills +3"} -- 29 SI
			-- = 74 Spell Interrupt-

	-- Cure Set --
	sets.Midcast.Cure = {
			main="Queller Rod", -- 10 + II+2
			--sub="Genbu's Shield", -- 4
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum", 
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, -- 10
			neck="Cleric's Torque", -- 5
			ear1="Mendi. Earring", -- 5
			ear2="Glorious Earring", -- II+2
			body="Ebers Bliaud +1",
			hands="Kaykaus Cuffs", -- 10
			ring1="Stikini Ring +1",
			ring2="Lebeche Ring", -- 3
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}}, -- 10
			waist="Luminary Sash",
			legs="Ebers Pant. +1",
			feet="Vanya Clogs"} -- 10
			-- = 

	-- Cure Enmity Set --
	sets.Midcast.Cure.Enmity = set_combine(sets.Midcast.Cure,{})

	-- Curaga Set --
	sets.Midcast.Curaga = {
			main="Queller Rod",
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
			neck="Cleric's Torque",
			ear1="Mendi. Earring", -- 5
			ear2="Glorious Earring",
			body="Theo. Briault +3",
			hands="Kaykaus Cuffs",
			ring1="Stikini Ring +1",
			ring2="Lebeche Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Luminary Sash",
			legs="Ebers Pant. +1",
			feet="Vanya Clogs"}

	-- Curaga Enmity Set --
	sets.Midcast.Curaga.Enmity = set_combine(sets.Midcast.Curaga,{})

	-- Enhancing Set --
	sets.Midcast['Enhancing Magic'] = {
			main={ name="Gada", augments={'Enh. Mag. eff. dur. +6','STR+6','Mag. Acc.+12','"Mag.Atk.Bns."+17','DMG:+5',}},
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head="Befouled Crown",
			neck="Incanter's Torque",
			ear1="Andoaa Earring",
			ear2="Gifted Earring",
			body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back="Mending Cape",
			waist="Embla Sash",
			legs="Piety Pantaloons +1",
			feet="Theo. Duckbills +3"}

	-- Barspells Set --
	sets.Midcast.Bar = {
			main="Beneficus",
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head="Ebers Cap +1",
			neck="Incanter's Torque",
			ear1="Andoaa Earring",
			ear2="Gifted Earring",
			body="Ebers Bliaud +1",
			hands="Ebers Mitts +1",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Olympus Sash",
			legs="Piety Pantaloons +1",
			feet="Ebers Duckbills +1"}

	-- Regen Set --
	sets.Midcast.Regen = set_combine(sets.Midcast.Haste,{
			main="Bolelabunga",
			sub="Ammurapi Shield",
			head="Inyanga Tiara +2",
			body="Piety Briault +3",
			hands="Ebers Mitts +1",
			legs="Th. Pantaloons +2"})
	
	-- Auspice Set --
	sets.Midcast.Auspice = set_combine(sets.Midcast.Haste,{feet="Ebers Duckbills +1"})
			
	-- Shellra V --
	sets.Midcast.Shellra = set_combine(sets.Midcast.Haste,{})
			
	-- Dia TH Set --
	sets.Midcast.Dia = set_combine(sets.Midcast['Enfeebling Magic'],{
			waist={ name="Chaac Belt", augments={'"Treasure Hunter"+1','MND+2','HP+9',}},
			legs={ name="Chironic Hose", augments={'DEX+3','Mag. Acc.+1','"Treasure Hunter"+1','Accuracy+18 Attack+18','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
			feet={ name="Chironic Slippers", augments={'VIT+14','Rng.Acc.+15','"Treasure Hunter"+2','Accuracy+8 Attack+8',}}})

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast.Haste,{neck="Nodens Gorget",waist="Siegal Sash"})

	-- Na Set --
	sets.Midcast.Na = set_combine(sets.Midcast.Haste,{main="Yagrush",sub="Genmei Shield",head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},neck="Cleric's Torque",body="Inyanga Jubbah +1",legs="Ebers Pant. +1",hands="Ebers Mitts +1",back="Mending Cape"})
	
	-- Sacrifice set (Built with Fast Casrt + Haste in mind)
	sets.Midcast.Sacrifice = {
			main={ name="Grioavolr", augments={'Enfb.mag. skill +12','MND+5','Mag. Acc.+28','"Mag.Atk.Bns."+30',}}, -- 5FC
			sub="Enki Strap",
			head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}}, -- 10FC 8H
			neck="Cleric's Torque", -- 6FC
			ear1="Malignance Earring", -- 4FC
			ear2="Loquacious Earring", -- 2FC
			body="Inyanga Jubbah +1", -- 13FC + 2H
			hands="Fanatic Gloves", -- 5FC 3H
			ring1="Prolix Ring", -- 3FC
			ring2="Kishar Ring", -- 4FC
			back="Swith Cape +1", -- 3FC
			waist="Embla Sash", -- 5FC
			legs="Lengo Pants", -- 5FC 5H
			feet={ name="Telchine Pigaches", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}} -- 4FC 3H
			-- = 69 Fastcast + 21 Haste

	-- Cursna Set --
	sets.Midcast.Cursna = {
			main="Yagrush",
			sub="Genbu's Shield",
			head={ name="Vanya Hood", augments={'Healing magic skill +20','"Cure" spellcasting time -7%','Magic dmg. taken -3',}},
			neck="Debilis Medallion",
			ear1="Malignance Earring",
			ear2="Loquac. Earring", -- upgrade available
			body="Ebers Bliaud +1",
			hands="Fanatic Gloves",
			ring1="Menelaus's Ring",
			ring2="Haoma's Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Gishdubar Sash",
			legs="Th. Pantaloons +2",
			feet="Vanya Clogs",}

	-- Divine Set --
	sets.Midcast['Divine Magic'] = {
			main="Daybreak",
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Chironic Hat", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','CHR+8','Mag. Acc.+12','"Mag.Atk.Bns."+11',}},
			neck="Incanter's Torque",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body="Theo. Briault +3",
			hands="Inyan. Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Luminary Sash",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','MND+13','Mag. Acc.+11','"Mag.Atk.Bns."+10',}},
			feet="Theo. Duckbills +3"}

	-- Banish Set --
	sets.Midcast.Banish = {
			main="Daybreak",
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Chironic Hat", augments={'DEX+13','Attack+7','Magic burst dmg.+14%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
			neck="Mizu. Kubikazari",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body={ name="Chironic Doublet", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Mag.Atk.Bns."+11',}},
			hands={ name="Chironic Gloves", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +1','MND+4','"Mag.Atk.Bns."+11',}},
			ring1="Stikini Ring +1",
			ring2="Freke Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Eschan Stone",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','MND+13','Mag. Acc.+11','"Mag.Atk.Bns."+10',}},
			feet={ name="Chironic Slippers", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Mag. Acc.+10','"Mag.Atk.Bns."+9',}}}

	-- Holy Set --
	sets.Midcast.Holy = {
			main="Daybreak",
			sub="Ammurapi Shield",
			ammo="Pemphredo Tathlum",
			head={ name="Chironic Hat", augments={'DEX+13','Attack+7','Magic burst dmg.+14%','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
			neck="Mizu. Kubikazari",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body={ name="Chironic Doublet", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','"Mag.Atk.Bns."+11',}},
			hands={ name="Chironic Gloves", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +1','MND+4','"Mag.Atk.Bns."+11',}},
			ring1="Stikini Ring +1",
			ring2="Freke Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			--waist="Eschan Stone",
			waist="Hachirin-no-Obi",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','MND+13','Mag. Acc.+11','"Mag.Atk.Bns."+10',}},
			feet={ name="Chironic Slippers", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Mag. Acc.+10','"Mag.Atk.Bns."+9',}}}
			
	sets.Midcast.Luminohelix = sets.Midcast.Holy
	
	-- Enfeebling Set --
	sets.Midcast['Enfeebling Magic'] = {
			main={ name="Grioavolr", augments={'Enfb.mag. skill +12','MND+5','Mag. Acc.+28','"Mag.Atk.Bns."+30',}},
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head={ name="Chironic Hat", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','CHR+8','Mag. Acc.+12','"Mag.Atk.Bns."+11',}},
			neck="Incanter's Torque",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body="Theo. Briault +3",
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Luminary Sash",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','MND+13','Mag. Acc.+11','"Mag.Atk.Bns."+10',}},
			feet="Theo. Duckbills +3"}

	-- Dark Magic Set --
	sets.Midcast['Dark Magic'] = {
			main={ name="Grioavolr", augments={'Enfb.mag. skill +12','MND+5','Mag. Acc.+28','"Mag.Atk.Bns."+30',}},
			sub="Enki Strap",
			ammo="Pemphredo Tathlum",
			head={ name="Chironic Hat", augments={'Mag. Acc.+23 "Mag.Atk.Bns."+23','CHR+8','Mag. Acc.+12','"Mag.Atk.Bns."+11',}},
			neck="Incanter's Torque",
			ear1="Regal Earring",
			ear2="Malignance Earring",
			body="Theo. Briault +3",
			hands="Inyanga Dastanas +2",
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Luminary Sash",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','MND+13','Mag. Acc.+11','"Mag.Atk.Bns."+10',}},
			feet="Theo. Duckbills +3"}

	-- Impact Set --
	sets.Midcast.Impact = {}

	-- JA Sets --
	sets.JA = {}
	sets.JA.Benediction = {body="Piety Briault +3"}
	sets.JA.Martyr = {hands="Piety Mitts"}
	sets.JA.Devotion = {head="Piety Cap"}

	-- Divine Caress Set --
	sets.JA['Divine Caress'] = {
		hands="Ebers Mitts +1",
		back="Mending Cape"}

	-- Melee Set --
	sets.Melee = set_combine(sets.Midcast.Haste,{
			head="Ayanmo Zucchetto +1",
			neck="Lissome Necklace",
			ear1="Eabani Earring",
			ear2="Suppanomimi",
			body="Ayanmo Corazza +2",
			hands={ name="Chironic Gloves", augments={'Accuracy+22','"Dual Wield"+5',}},
			ring1="Hetairoi Ring",
			ring2="Ilabrat Ring",
			back={ name="Alaunus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}},
			waist="Windbuffet Belt +1",
			legs="Ayanmo Cosciales +1",
			feet={ name="Chironic Slippers", augments={'CHR+2','Pet: "Subtle Blow"+8','Quadruple Attack +3','Accuracy+17 Attack+17','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}})

	-- WS Base Set --
	sets.WS = {
			head="Ayanmo Zucchetto +1",
			neck="Fotia Gorget",
			ear1="Brutal Earring",
			ear2="Ishvara Earring",
			body="Ayanmo Corazza +2",
			hands={ name="Chironic Gloves", augments={'Accuracy+22','"Dual Wield"+5',}},
			ring1="Rufescent Ring",
			ring2="Ilabrat Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Fotia Belt",
			legs="Ayanmo Cosciales +1",
			feet={ name="Chironic Slippers", augments={'CHR+2','Pet: "Subtle Blow"+8','Quadruple Attack +3','Accuracy+17 Attack+17','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}}
	sets.WS['Hexa Strike'] = {
			head="Ayanmo Zucchetto +1",
			neck="Fotia Gorget",
			ear1="Brutal Earring",
			ear2="Ishvara Earring",
			body="Ayanmo Corazza +2",
			hands={ name="Chironic Gloves", augments={'Accuracy+22','"Dual Wield"+5',}},
			ring1="Hetairoi Ring",
			ring2="Begrudging Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Windbuffet Belt +1",
			legs="Ayanmo Cosciales +1",
			feet="Ayanmo Gambieras +1"}
	sets.WS['Mystic Boon'] = {
			head="Ayanmo Zucchetto +1",
			neck="Fotia Gorget",
			ear1="Nourish. Earring +1",
			ear2="Moonshade Earring",
			body="Ayanmo Corazza +2",
			hands={ name="Chironic Gloves", augments={'Accuracy+22','"Dual Wield"+5',}},
			ring1="Rufescent Ring",
			ring2="Stikini Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Fotia Belt",
			legs={ name="Chironic Hose", augments={'Mag. Acc.+19 "Mag.Atk.Bns."+19','MND+13','Mag. Acc.+11','"Mag.Atk.Bns."+10',}},
			feet={ name="Chironic Slippers", augments={'CHR+2','Pet: "Subtle Blow"+8','Quadruple Attack +3','Accuracy+17 Attack+17','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}}
	sets.WS.Dagan = {
			head="Ayanmo Zucchetto +1",
			neck="Lissome Necklace",
			ear1="Brutal Earring",
			ear2="Ishvara Earring",
			body="Ayanmo Corazza +2",
			hands={ name="Chironic Gloves", augments={'Accuracy+22','"Dual Wield"+5',}},
			ring1="Hetairoi Ring",
			ring2="Petrov Ring",
			back={ name="Alaunus's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Cure" potency +10%',}},
			waist="Windbuffet Belt +1",
			legs="Ayanmo Cosciales +1",
			feet={ name="Chironic Slippers", augments={'CHR+2','Pet: "Subtle Blow"+8','Quadruple Attack +3','Accuracy+17 Attack+17','Mag. Acc.+19 "Mag.Atk.Bns."+19',}}}
end

function pretarget(spell,action)
	if midaction() then
		canceled = true
		return
	elseif spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif Na_Spells:contains(spell.english) then -- Auto Divine Caress --
		if windower.ffxi.get_ability_recasts()[32] < 1 and (spell.target.type == 'PLAYER' or spell.target.name == player.name) and not buffactive.amnesia and not buffactive.charm and spell.english ~= "Erase" then
			cancel_spell()
			send_command('DivineCaress;wait 1.7;input /ma "'..spell.english..'" '..spell.target.name)
		end
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == 'Light Arts' and not buffactive['Addendum: White'] then
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
		if spell.english == 'Dark Arts' and not buffactive['Addendum: Black'] then
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
	if canceled then
		return
	elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 17+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			--elseif Na_Spells:contains(spell.english) and DC then
				--equipSet = set_combine(sets.Precast['Healing Magic'],{back="Mending Cape",hands="Ebers Mitts +1"})
			elseif spell.english == "Stoneskin" then
				equip(sets.Precast[spell.english])
			elseif spell.english == "Erase" then
				equip(sets.Precast['Healing Magic'])
			elseif spell.english == "Impact" then
				equip(set_combine(sets.Precast.FastCast,{body="Twilight Cloak"}))
			elseif spell.english == "Dispelga" then
				equip(set_combine(sets.Precast.FastCast,{main="Daybreak",sub="Genmei Shield"}))
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
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			if sets.WS[spell.english] then
				equip(sets.WS[spell.english])
			end
		end
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
--	if sets.Precast[spell.element] and not Na_Spells:contains(spell.english) and Elemental_Staff == 'ON' then
--		equip(sets.Precast[spell.element])
--	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if Na_Spells:contains(spell.english) then
			equipSet = equipSet.Na
			if DC then
				equipSet = set_combine(equipSet,sets['Divine Caress'])
			end
		elseif spell.english == 'Cursna' then
			equipSet = equipSet.Cursna
		elseif spell.english:startswith('Cur') and spell.english ~= 'Cursna' then
			if spell.english:startswith('Cure') then
				if Enmity == 'ON' then
					equipSet = equipSet.Cure.Enmity
				else
					equipSet = equipSet.Cure
				end
			elseif spell.english:startswith('Cura') then
				if Enmity == 'ON' then
					equipSet = equipSet.Curaga.Enmity
				else
					equipSet = equipSet.Curaga
				end
			elseif spell.english:startswith('Curs') then
					equipSet = equipSet.Cursna
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		--elseif spell.english == "Protectra V" then -- Equip Aug'ed Piety Duckbills +1 When You Cast Protectra V --
			--equipSet = set_combine(equipSet,{feet="Piety Duckbills +1"})
		elseif spell.english == "Shellra V" or spell.english == "Protectra V"then -- Equip Aug'ed Piety Pantaln. +1 When You Cast Shellra V --
			equipSet = equipSet.Shellra
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english:startswith('Bar') then
			equipSet = equipSet.Bar
		elseif spell.english:startswith('Aus') then
			equipSet = equipSet.Auspice
		elseif spell.english:startswith('Regen') then
			equipSet = equipSet.Regen
		elseif spell.english:startswith('Dia') or spell.english == "Banishga" then -- Enfeeb set + TH --
			equipSet = equipSet.Dia
		elseif spell.english:startswith('Banish') then
			equipSet = equipSet.Banish
		elseif spell.english:startswith('Boost') then
			equipSet = equipSet.Boost	
		elseif spell.english == "Dispelga" then
			equipSet = equip(set_combine(sets.Midcast['Enfeebling Magic'],{main="Daybreak",sub="Genmei Shield"}))			
		elseif spell.english == "Sandstorm" or spell.english == "Rainstorm" or spell.english == "Windstorm" or spell.english == "Firestorm" or
		       spell.english == "Hailstorm" or spell.english == "Thunderstorm" or spell.english == "Voidstorm" or spell.english == "Aurorastorm" or
			   spell.english == "Aquaveil" or spell.english == "Blink" then
			equipSet = equipSet.Haste
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Holy') then
			equipSet = equipSet.Holy
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif spell.english:startswith('Reraise') or spell.english:startswith('Raise') or spell.english:startswith('Aris') then
			equipSet = equipSet.Raise
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Haste
		elseif spell.english == 'Cursna' then
			equipSet = equipSet.Cursna
		else
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end 
			if equipSet[spell.skill] then
				equipSet = equipSet[spell.skill]
			end
			if equipSet[spell.type] then
				equipSet = equipSet[spell.type]
			end
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end 
	equip(equipSet)
end

function aftercast(spell,action)
	if canceled then
		canceled = false
		return
	else
		if not spell.interrupted then
			if spell.type == "WeaponSkill" then
				send_command('wait 0.2;gs c TP')
			elseif spell.english == "Repose" or spell.english == "Sleep II" then -- Repose & Sleep II Countdown --
				send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
				send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
			elseif spell.english == "Banish III" then -- Banish III Countdown --
				send_command('wait 35;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
			end
		end
		status_change(player.status)
	end
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
		if Kiting == 'ON' then
			equip({feet="Herald's Gaiters"})
		end
	elseif new == 'Engaged' then
		equip(sets.Melee)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Arciela's Grace +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Arciela's Grace +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
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
	elseif buff == "Divine Caress" then
		DC = gain
	elseif buff == "weakness" then -- Weakness Timer --
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
	if command == 'C1' then -- Enmity Toggle --
		if Enmity == 'ON' then
			Enmity = 'OFF'
			add_to_chat(123,'Enmity Set: [OFF]')
		else
			Enmity = 'ON'
			add_to_chat(158,'Enmity Set: [ON]')
		end
		status_change(player.status)
	elseif command == 'C2' then -- Follow Toggle --
		send_command('input /ta Bokura;input /lockon;wait .3;setkey numpad8 down;wait .3;setkey numpad7 down;wait .3;setkey numpad7 up;wait .3;setkey numpad8 up')
	elseif command == 'C3' then -- Kiting Toggle --
		if Kiting == 'ON' then
			Kiting = 'OFF'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Kiting = 'ON'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C7' then
		if Armor == 'PDT' then -- PDT Toggle --
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
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
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: '..tostring(player.tp))
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
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
	elseif buffactive["Light Arts"] or buffactive["Addendum: White"] then
		return originalCost*.9
	elseif buffactive["Dark Arts"] or buffactive["Addendum: Black"] then
		return originalCost*1.1
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index > 1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
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
	if player.sub_job == 'SCH' then
		set_macro_page(10, 12)
	elseif player.sub_job == 'BLM' then
		set_macro_page(10, 12)
	elseif player.sub_job == 'RDM' then
		set_macro_page(10, 12)
	elseif player.sub_job == 'DNC' then
		set_macro_page(10, 12)
	elseif player.sub_job == 'NIN' then
		set_macro_page(10, 12)
	else
		set_macro_page(10, 12)
	end
end