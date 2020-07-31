-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	WeaponIndex = 1
	WeaponArray = {"Melee","TH"} -- Default Sub Weapon Is Melee. Don't Input Main/Sub In TP Sets. Melee = Damage Type Dagger | TH = TH Type Dagger --
	IdleIndex = 1
	IdleArray = {"Regen","Movement"} -- Default Idle Set Is Movement --
	SA = false
	TA = false
	TH = 'OFF' -- Set Default Full TH ON or OFF Here --
	Rancor = 'OFF' -- Set Default Rancor ON or OFF Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="Exenterator", SC2="HasteSamba", SC3="Ranged"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	sets.Idle = {}
	-- Regen Set --
	sets.Idle.Regen = {
			ammo="Staunch Tathlum +1",
			head="Malignance Chapeau",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Infused Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Defending Ring",
			ring2="Dark Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Flume Belt",
			legs="Malignance Tights",
			feet="Turms Leggings"}

	-- Damage Type Daggers --
	sets.Idle.Regen.Melee = set_combine(sets.Idle.Regen,{})

	-- Damage & TH Types Daggers --
	sets.Idle.Regen.TH = set_combine(sets.Idle.Regen,{})

	-- Movement Set --
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})

	-- Damage Type Daggers --
	sets.Idle.Movement.Melee = set_combine(sets.Idle.Movement,{})
	
	-- Damage & TH Types Daggers --
	sets.Idle.Movement.TH = set_combine(sets.Idle.Movement,{})

	-- Normal TP Sets --
	sets.TP = {
			ammo="Yamarang",
			head="Adhemar Bonnet +1",
			neck="Assassin's Gorget +1",
			ear1="Sherida Earring",
			ear2="Telos Earring",
			--ear2="Dedition Earring",
			body="Pillager's Vest +3",
			hands="Adhemar Wrist. +1",
			ring1="Gere Ring",
			ring2="Epona's Ring", --ring2="Ilabrat Ring", --
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Reiki Yotai",
			legs="Samnuha Tights",
			feet="Plun. Poulaines +3"}--feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.TP.MidACC = set_combine(sets.TP,{ear2="Telos Earring",legs="Pill. Cullotes +3"})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{head="Plun. Bonnet +3"})

	-- March x2 + (Haste or Samba) --
	-- March + Haste + Samba --
	-- (Embrava or Geo Haste) + (March or Haste or Samba) --
	sets.TP.MidHaste = set_combine(sets.TP,{})
	sets.TP.MidACC.MidHaste = set_combine(sets.TP.MidHaste,{})
	sets.TP.HighACC.MidHaste = set_combine(sets.TP.MidACC.MidHaste,{})

	-- March x2 + Haste + Samba --
	-- Embrava + (March or Haste) + Samba --
	-- Geo Haste + (March or Haste or Embrava) + Samba --
	sets.TP.HighHaste = set_combine(sets.TP.MidHaste,{})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{})

	-- Full TH TP Set --
	sets.TP.TH = {
			hands="Plun. Armlets +3",
			--waist="Chaac Belt",
			feet="Skulk. Poulaines +1"}

	-- TP Rancor ON Neck --
	sets.TP.Rancor = {neck="Rancor Collar"}

	-- TP Feint Set --
	sets.TP.Feint = {legs="Plun. Culottes +1"}

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Staunch Tathlum +1",
			head="Malignance Chapeau",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Infused Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Defending Ring",
			ring2="Dark Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Flume Belt",
			legs="Malignance Tights",
			feet="Turms Leggings"}

	sets.MDT = set_combine(sets.PDT,{})

	-- Hybrid/Evasion Sets --
	sets.TP.Hybrid = {
			ammo="Yamarang",
			head="Malignance Chapeau",
			neck="Assassin's Gorget +1",
			ear1="Sherida Earring",
			ear2="Telos Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Gere Ring",
			ring2="Defending Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Reiki Yotai",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.Evasion = set_combine(sets.PDT,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Expeditious Pinion",
			head="Pill. Bonnet +3",
			neck="Assassin's Gorget +1",
			ear1="Sherida Earring",
			ear2="Moonshade Earring",
			body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','DEX+9','Attack+11',}},
			hands="Meg. Gloves +2",
			ring1="Ramuh Ring +1",
			ring2="Ilabrat Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Grunfeld Rope",
			legs="Lustratio Subligar",
			feet="Plun. Poulaines +3"} --feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}

	-- WS Sets --
	sets.WS["Mercy Stroke"] = {}
	sets.WS["Mercy Stroke"].SA = {hands="Skulk. Armlets +1"}
	sets.WS["Mercy Stroke"].TA = {hands="Pill. Armlets +2"}
	
	sets.WS["Shark Bite"] = {
			ammo="Expeditious Pinion",
			head="Pill. Bonnet +3",
			neck="Assassin's Gorget +1",
			ear1="Sherida Earring",
			ear2="Moonshade Earring",
			body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','DEX+9','Attack+11',}},
			hands="Meg. Gloves +2",
			ring1="Ramuh Ring +1",
			ring2="Ilabrat Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Grunfeld Rope",
			legs="Lustratio Subligar",
			feet="Plun. Poulaines +3"}
	sets.WS["Shark Bite"].SA = {hands="Skulk. Armlets +1"}
	sets.WS["Shark Bite"].TA = {hands="Pill. Armlets +2"}
	
	sets.WS.Exenterator =  {
			ammo="Ginsen",
			head="Plun. Bonnet +3",
			neck="Fotia Gorget",
			ear1="Sherida Earring",
			ear2="Brutal Earring",
			body="Plunderer's Vest +3",
			hands="Mummu Wrists +2",
			ring1="Ilabrat Ring",
			ring2="Gere Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Meg. Chaussses +2",
			feet="Plun. Poulaines +3"}
	sets.WS.Exenterator.SA = set_combine(sets.WS.Exenterator,{hands="Skulk. Armlets +1"})
	sets.WS.Exenterator.TA = set_combine(sets.WS.Exenterator,{hands="Pill. Armlets +2"})

	sets.WS.Evisceration =  {
			ammo="Yetshila +1",
			head="Adhemar Bonnet +1",
			neck="Fotia Gorget",
			ear1="Odr Earring",
			ear2="Sherida Earring",
			body="Plunderer's Vest +3",
			hands="Mummu Wrists +2",
			ring1="Mummu Ring",
			ring2="Begrudging Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
			waist="Fotia Belt",
			legs="Pill. Culottes +3",
			feet="Mummu Gamash. +2"}--feet={ name="Herculean Boots", augments={'Accuracy+29','Crit.hit rate+5','STR+9','Attack+5',}}}
	sets.WS.Evisceration.SA = set_combine(sets.WS.Evisceration,{})
	sets.WS.Evisceration.TA = set_combine(sets.WS.Evisceration,{hands="Pill. Armlets +2"})

	sets.WS["Rudra's Storm"] = {
			ammo="Expeditious Pinion",
			head="Pill. Bonnet +3",
			neck="Assassin's Gorget +1",
			ear1="Sherida Earring",
			ear2="Moonshade Earring",
			--body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','DEX+9','Attack+11',}},
			body="Plunderer's Vest +3",
			hands="Meg. Gloves +2",
			ring1="Ramuh Ring +1",
			ring2="Ilabrat Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Grunfeld Rope",
			legs="Lustratio Subligar",
			feet="Plun. Poulaines +3"}
	sets.WS["Rudra's Storm"].SA = set_combine(sets.WS["Rudra's Storm"],{ammo="Yetshila +1", body="Plunderer's Vest +3",head="Pill. Bonnet +3"})
	sets.WS["Rudra's Storm"].TA = set_combine(sets.WS["Rudra's Storm"],{ammo="Yetshila +1", body="Plunderer's Vest +3",head="Pill. Bonnet +3"})

	sets.WS["Aeolian Edge"] =  {
			ammo="Pemphredo Tathlum",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Moonshade Earring",
			ear2="Friomisi Earring",
			body="Samnuha Coat",
			hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+19','Weapon skill damage +3%','Accuracy+3 Attack+3','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			ring1="Shiva Ring +1",
			ring2="Dingir Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Eschan Stone",
			legs={ name="Herculean Trousers", augments={'Phys. dmg. taken -4%','"Subtle Blow"+4','Weapon skill damage +7%','Accuracy+18 Attack+18','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
			feet={ name="Herculean Boots", augments={'AGI+4','"Mag.Atk.Bns."+20','Magic Damage +4','Accuracy+11 Attack+11','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}}

	sets.WS["Mandalic Stab"] = {
			ammo="Expeditious Pinion",
			head="Pill. Bonnet +3",
			neck="Assassin's Gorget +1",
			ear1="Sherida Earring",
			ear2="Moonshade Earring",
			body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','DEX+9','Attack+11',}},
			hands="Meg. Gloves +2",
			ring1="Ramuh Ring +1",
			ring2="Ilabrat Ring",
			back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%',}},
			waist="Grunfeld Rope",
			legs="Lustratio Subligar",
			feet="Plun. Poulaines +3"}
	sets.WS["Mandalic Stab"].SA = set_combine(sets.WS["Rudra's Storm"],{ammo="Yetshila +1", body="Meg. Cuirie +2",head="Pill. Bonnet +3"})
	sets.WS["Mandalic Stab"].TA = set_combine(sets.WS["Rudra's Storm"],{ammo="Yetshila +1", body="Plunderer's Vest +3",head="Pill. Bonnet +3"})

	-- JA Sets --
	sets.JA = {}
	TH_Gear = {hands="Plun. Armlets +1",feet="Skulk. Poulaines +1"}
	sets.JA.Conspirator = {body="Skulker's Vest"}
	sets.JA.Accomplice = {head="Skulker's Bonnet +1"}
	sets.JA.Collaborator = {head="Skulker's Bonnet +1"}
	sets.JA["Perfect Dodge"] = {hands="Plun. Armlets +1"}
	sets.JA.Steal = {head="Plun. Bonnet +2",legs="Assassin's Culottes",feet="Pill. Poulaines +2"}
	sets.JA.Flee = {feet="Pill. Poulaines +2"}
	sets.JA.Despoil = {legs="Skulk. Culottes +1",feet="Skulk. Poulaines +1"}
	sets.JA.Mug = {head="Plun. Bonnet +2"}
	sets.JA.Hide = {body="Pillager's Vest +3"}
	sets.JA.Provoke = TH_Gear
	sets.JA["Sneak Attack"] = {hands="Skulk. Armlets +1"}
	sets.JA["Trick Attack"] = set_combine(sets.JA["Sneak Attack"],{})

	-- Step Set --
	sets.Step = set_combine({},TH_Gear)

	-- Flourish Set --
	sets.Flourish = set_combine({},TH_Gear)

	-- Waltz Set --
	sets.Waltz = {
			ammo="Yamarang",
			head="Mummu Bonnet +2",
			neck="Asperity Necklace",
			ear1="Suppanomimi",
			ear2="Brutal Earring",
			body="Passion Jacket",
			hands={ name="Herculean Gloves", augments={'"Waltz" potency +8%','DEX+4',}},
			ring1="Petrov Ring",
			ring2="Epona's Ring",
			back="Canny Cape",
			legs="Dashing Subligar", -- { name="Herculean Trousers", augments={'Accuracy+24','"Waltz" potency +11%','STR+10',}},
			feet="Rawhide Boots"}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Voltsurge Torque",
			ear2="Loquacious Earring",
			body={ name="Adhemar Jacket", augments={'HP+80','"Fast Cast"+7','Magic dmg. taken -3',}},
			hands="Leyline Gloves",
			ring1="Lebeche Ring",
			ring2="Prolix Ring"
	}
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Bead Necklace"})

	sets.Midcast = {
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Voltsurge Torque",
			ear1="Digni. Earring",
			ear2="Loquacious Earring",
			body={ name="Adhemar Jacket", augments={'HP+80','"Fast Cast"+7','Magic dmg. taken -3',}},
			hands="Leyline Gloves",
			ring1="Archon Ring",
			ring2="Stikini Ring",
			--back="Canny Cape",
			waist="Eschan Stone",
			legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+2','VIT+9','Mag. Acc.+14',}},
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	
	sets.Midcast.Absorb = set_combine(sets.Midcast,{})
	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.PDT,{{
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Voltsurge Torque",
			ear1="Digni. Earring",
			ear2="Loquacious Earring",
			body={ name="Adhemar Jacket", augments={'HP+80','"Fast Cast"+7','Magic dmg. taken -3',}},
			hands="Leyline Gloves",
			ring1="Archon Ring",
			ring2="Stikini Ring",
			--back="Canny Cape",
			waist="Eschan Stone",
			legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+2','VIT+9','Mag. Acc.+14',}},
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}})
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif spell.action_type == 'Ranged Attack' and spell.target.distance > 24.9 then
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
--		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
--			cancel_spell()
--			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
--		return
--		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if SA and equipSet["SA"] then
				equipSet = equipSet["SA"]
			end
			if TA and equipSet["TA"] then
				equipSet = equipSet["TA"]
			end
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if spell.english == "Evisceration" and player.tp > 2990 then -- Equip Jupiter's Pearl When You Have 3000 TP --
				equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
			end
			equip(equipSet)
--		end
	elseif spell.type=="JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
		if spell.english == "Sneak Attack" then
			SA = true
		end
		if spell.english == "Trick Attack" then
			TA = true
		end
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ni' then
				if buffactive['Copy Image (3)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
					return
				else
					equip(sets.Precast.Utsusemi)
				end
			else
				equip(sets.Precast.Utsusemi)
			end
		else
			equip(sets.Precast.FastCast)
		end
	elseif spell.type == 'Step' then
		equip(sets.Step)
	elseif spell.type:endswith('Flourish') then
		equip(sets.Flourish)
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
end

function midcast(spell,action)
	if spell.action_type == 'Ranged Attack' then
		equip(TH_Gear)
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english:startswith('Absorb') then
			equip(sets.Midcast.Absorb)
		else
			equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if spell.type == "WeaponSkill" and not spell.interrupted then
		send_command('wait 0.2;gs c TP')
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif Armor == 'EVA' then
		equip(sets.Evasion)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if (buffactive.Embrava and (buffactive.March or buffactive.Haste) and buffactive['Haste Samba']) or (buffactive.March == 2 and buffactive.Haste and buffactive['Haste Samba']) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava) and buffactive['Haste Samba']) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		if ((buffactive.Embrava or buffactive[580]) and (buffactive.March or buffactive.Haste or buffactive['Haste Samba'])) or (buffactive.March == 1 and buffactive.Haste and buffactive['Haste Samba']) or (buffactive.March == 2 and (buffactive.Haste or buffactive['Haste Samba'])) and equipSet["MidHaste"] then
			equipSet = equipSet["MidHaste"]
		end
		if SA then
			equipSet = set_combine(equipSet,sets.JA["Sneak Attack"])
		end
		if TA then
			equipSet = set_combine(equipSet,sets.JA["Trick Attack"])
		end
		if buffactive.Feint then
			equipSet = set_combine(equipSet,sets.TP.Feint)
		end
		if Rancor == 'ON' then -- Use Rancor Toggle For Rancor Collar --
			equipSet = set_combine(equipSet,sets.TP.Rancor)
		end
		if TH == 'ON' then -- Use TH Toggle To Lock Full TH Set --
			equipSet = set_combine(equipSet,sets.TP.TH)
		end
		equip(equipSet)
	else
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[WeaponArray[WeaponIndex]] then
			equipSet = equipSet[WeaponArray[WeaponIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "sneak attack" then
		SA = gain
	elseif buff == "trick attack" then
		TA = gain
	elseif buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
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
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
	elseif command == 'C17' then -- Sub Weapon Type Toggle --
		WeaponIndex = (WeaponIndex % #WeaponArray) + 1
		add_to_chat(158,'Sub Weapon Type: '..WeaponArray[WeaponIndex])
		status_change(player.status)
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C9' then -- Full TH Set Toggle --
		if TH == 'ON' then
			TH = 'OFF'
			add_to_chat(123,'Full TH Set: [Unlocked]')
		else
			TH = 'ON'
			add_to_chat(158,'Full TH Set: [Locked]')
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
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Evasion Toggle --
		if Armor == 'EVA' then
			Armor = 'None'
			add_to_chat(123,'Evasion Set: [Unlocked]')
		else
			Armor = 'EVA'
			add_to_chat(158,'Evasion Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Rancor Toggle --
		if Rancor == 'ON' then
			Rancor = 'OFF'
			add_to_chat(123,'Rancor: [OFF]')
		else
			Rancor = 'ON'
			add_to_chat(158,'Rancor: [ON]')
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
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.range ~= 'empty' then
		disable('range','ammo')
	elseif player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	else
		enable('range','ammo','ring1','ring2','back')
	end
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
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
	if player.sub_job == 'WAR' then
		set_macro_page(5, 4)
	elseif player.sub_job == 'DNC' then
		set_macro_page(5, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(5, 4)
	else
		set_macro_page(5, 4)
	end
end