-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For Shooting/QD/TP/WS. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {'Movement', 'Regen'} -- Default Idle Set Is Movement --
	Armor = 'None'
	define_roll_values()
	warning = true
	Lock_Main = 'OFF' -- Set Default Lock Main Weapon ON or OFF Here --
	AutoGunWS = "Last Stand" -- Set Auto Gun WS Here --
	AutoMode = 'OFF' -- Set Default Auto RA/WS ON or OFF Here --
	Obi = 'ON' -- Turn Default Obi ON or OFF Here --
	ammo_warning_limit = 10 -- Set Ammo Limit Check Here --
	target_distance = 5 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	ACC_Shots = S{"Light Shot","Dark Shot"}

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	sc_map = {SC1="CoursersRoll", SC2="DiaII", SC3="LightShot"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Idle/Town Sets --
	sets.Idle = {
			ammo="Chrono Bullet",
			head="Malignance Chapeau",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Etiolation Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Flume Belt",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.Idle.Regen = {
			ammo="Chrono Bullet",
			head="Malignance Chapeau",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Etiolation Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Flume Belt",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})

	-- QD Sets --
	sets.QD = {
			ammo="Animikii Bullet",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Hecate's Earring",
			ear2="Friomisi Earring",
			body="Lanun Frac +3",
			hands="Leyline Gloves",
			ring1="Ilabrat Ring",
			ring2="Dingir Ring",
			back="Gunslinger's Cape",
			waist="Eschan Stone",
			legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+21','Crit.hit rate+1','Accuracy+7 Attack+7','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
			feet="Chasseur's Bottes +1"}
	sets.QD.MidACC = set_combine(sets.QD,{feet="Chasseur's Bottes +1"})
	sets.QD.HighACC = set_combine(sets.QD.MidACC,{
			ammo="Animikii Bullet",
			head="Mummu Bonnet +2",
			neck="Sanctity Necklace",
			ear1="Hecate's Earring",
			ear2="Friomisi Earring",
			body="Mummu Jacket +1",
			hands="Mummu Wrists +1",
			ring1="Stikini Ring",
			ring2="Stikini Ring",
			back="Gunslinger's Cape",
			waist="Eschan Stone",
			legs="Mummu Kecks +2",
			feet="Mummu Gamashes +1"})

	-- PDT/MDT Sets --
	sets.PDT = {
			ammo="Chrono Bullet",
			head="Malignance Chapeau",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Etiolation Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Dark Ring",
			ring2="Defending Ring",
			back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Flume Belt",
			legs="Malignance Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}

	sets.MDT = set_combine(sets.PDT,{})

	-- Roll Set --
	sets.Rolls = {
			head="Lanun Tricorne",
			hands="Chasseur's Gants +1",
			neck="Regal Necklace",
			ring2="Luzaf's Ring",
			back="Camulus's Mantle"}

	-- Preshot --
	sets.Preshot = {
			ammo="Chrono Bullet",
			head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
		--	neck="Sanctity Necklace",
		--	ear1="Suppanomimi",
		--	ear2="Volley Earring",
			body="Laksa. Frac +3",
			hands="Carmine Fin. Ga. +1",
			ring1="Ilabrat Ring",
			ring2="Cacoethic Ring +1",
			back="Gunslinger's Cape",
			waist="Impulse Belt",
			legs="Adhemar Kecks",
			feet="Meg. Jam. +2"}

	-- Shooting Base Set --
	sets.Midshot = {
			ammo="Chrono Bullet",
			--head="Meghanada Visor +2",
			head="Malignance Chapeau",
			neck="Iskur Gorget",
			ear1="Enervating Earring",
			ear2="Telos Earring",
		--	body="Laksa. Frac +3",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			--hands="Meg. Gloves +2",
		--	ring1="Hajduk Ring",
		--	ring2="Ilabrat Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
			waist="Eschan Stone",
			legs="Adhemar Kecks +1",
			feet="Meg. Jam. +2"}

	-- Death Penalty Sets --
	sets.Midshot['Death Penalty'] = {}
	sets.Midshot['Death Penalty'].MidACC = set_combine(sets.Midshot['Death Penalty'],{})
	sets.Midshot['Death Penalty'].HighACC = set_combine(sets.Midshot['Death Penalty'].MidACC,{})

	-- Armageddon Sets --
	sets.Midshot.Armageddon = {}
	sets.Midshot.Armageddon.MidACC = set_combine(sets.Midshot.Armageddon,{})
	sets.Midshot.Armageddon.HighACC = set_combine(sets.Midshot.Armageddon.MidACC,{})


	-- Melee Sets --
	sets.Melee = {
			ammo="Chrono Bullet",
			head="Adhemar Bonnet +1",
			neck="Iskur Gorget",
			ear1="Brutal Earring",
			ear2="Telos Earring",
			body="Adhemar Jacket +1",
			hands="Adhemar Wrist. +1",
			ring1="Hetairoi Ring",
			ring2="Epona's Ring",
			back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Reiki Yotai",
			legs="Samnuha Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.Melee.MidACC = set_combine(sets.Melee,{head="Malignance Chapeau",ring1="Chirich Ring +1",legs="Malignance Tights",})
	sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{ear1="Mache Earring +1"})
	
	-- Hybrid/Evasion Sets --
	sets.Melee.Hybrid = set_combine(sets.Melee,{
			head="Malignance Chapeau",
			--neck="Assassin's Gorget +1",
			--ear1="Sherida Earring",
			--ear2="Telos Earring",
			body="Malignance Tabard",
			hands="Malignance Gloves",
			ring1="Defending Ring",
			ring2="Epona's Ring",
			--back={ name="Toutatis's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			--waist="Reiki Yotai",
			legs="Malignance Tights"
			--feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}
			})
	sets.Melee.Hybrid.MidACC = set_combine(sets.Melee.Hybrid,{})
	sets.Melee.Hybrid.HighACC = set_combine(sets.Melee.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Chrono Bullet",
			head="Meghanada Visor +1",
			neck="Fotia Gorget",
			ear1="Enervating Earring",
			ear2="Moonshade Earring",
			body="Meg. Cuirie +2",
			hands="Meg. Gloves +2",
			ring1="Ilabrat Ring",
			ring2="Dingir Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +2",
			feet="Meg. Jam. +2"}

	-- Last Stand Sets --
	sets.WS["Last Stand"] = {
			ammo="Chrono Bullet",
			head="Meghanada Visor +1",
			--neck="Iskur Gorget",
			neck="Fotia Gorget",
			ear1="Enervating Earring",
			ear2="Moonshade Earring",
			body="Laksa. Frac +3",
			hands="Meg. Gloves +2",
			ring1="Ilabrat Ring",
			ring2="Dingir Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +2",
			feet="Lanun Bottes +3"} --feet="Meg. Jam. +2"}
	sets.WS["Last Stand"].MidACC = set_combine(sets.WS["Last Stand"],{feet="Meg. Jam. +2"})
	sets.WS["Last Stand"].HighACC = set_combine(sets.WS["Last Stand"].MidACC,{})

	-- Wildfire Sets --
	sets.WS.Wildfire = {
			ammo="Chrono Bullet",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Friomisi Earring",
			ear2="Hecate's Earring",
			body={ name="Herculean Vest", augments={'"Conserve MP"+1','"Mag.Atk.Bns."+25','Accuracy+9 Attack+9','Mag. Acc.+14 "Mag.Atk.Bns."+14',}},
			hands="Carmine Fin. Ga. +1",
			ring1="Ilabrat Ring",
			ring2="Dingir Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Eschan Stone",
			legs={ name="Herculean Trousers", augments={'Phys. dmg. taken -4%','"Subtle Blow"+4','Weapon skill damage +7%','Accuracy+18 Attack+18','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
			feet="Lanun Bottes +3"}
	sets.WS.Wildfire.MidACC = set_combine(sets.WS.Wildfire,{})
	sets.WS.Wildfire.HighACC = set_combine(sets.WS.Wildfire.MidACC,{})

	-- Leaden Salute Sets --
	sets.WS['Leaden Salute'] = {
			ammo="Chrono Bullet",
			head="Pixie Hairpin +1",
			neck="Sanctity Necklace",
			ear1="Friomisi Earring",
			ear2="Moonshade Earring",
			body="Lanun Frac +3",
			hands="Carmine Fin. Ga. +1",
			ring1="Archon Ring",
			ring2="Dingir Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Hachirin-no-Obi",
			legs={ name="Herculean Trousers", augments={'Phys. dmg. taken -4%','"Subtle Blow"+4','Weapon skill damage +7%','Accuracy+18 Attack+18','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
			feet="Lanun Bottes +3"}
	sets.WS['Leaden Salute'].MidACC = set_combine(sets.WS['Leaden Salute'],{})
	sets.WS['Leaden Salute'].HighACC = set_combine(sets.WS['Leaden Salute'].MidACC,{})
	
	-- Aeolian Edge Sets --
	sets.WS['Aeolian Edge'] = {
			ammo="Chrono Bullet",
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Sanctity Necklace",
			ear1="Friomisi Earring",
			ear2="Hecate's Earring",
			body="Lanun Frac +3",
			hands={ name="Herculean Gloves", augments={'"Mag.Atk.Bns."+19','Weapon skill damage +3%','Accuracy+3 Attack+3','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
			ring1="Ilabrat Ring",
			ring2="Dingir Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Eschan Stone",
			legs={ name="Herculean Trousers", augments={'Phys. dmg. taken -4%','"Subtle Blow"+4','Weapon skill damage +7%','Accuracy+18 Attack+18','Mag. Acc.+19 "Mag.Atk.Bns."+19',}},
			feet="Lanun Bottes +3"}
			
	sets.WS['Circle Blade'] = {			
			head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
			neck="Caro Necklace",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','DEX+9','Attack+11',}},
			hands="Meg. Gloves +2",
			left_ring="Ilabrat Ring",
			right_ring="Rufescent Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	
	-- Savage Blade Sets --
	sets.WS['Savage Blade'] = {
			head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
			neck="Caro Necklace",
			ear1="Brutal Earring",
			ear2="Moonshade Earring",
			body="Laksa. Frac +3",--body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','DEX+9','Attack+11',}},
			hands="Meg. Gloves +2",
			left_ring="Ilabrat Ring",
			right_ring="Rufescent Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.WS['Savage Blade'].MidACC = set_combine(sets.WS['Savage Blade'],{})
	sets.WS['Savage Blade'].HighACC = set_combine(sets.WS['Savage Blade'].MidACC,{})
	
-- Savage Blade Sets --
	sets.WS['Swift Blade'] = {
			head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body={ name="Herculean Vest", augments={'Accuracy+25 Attack+25','"Triple Atk."+3','DEX+9','Attack+11',}},
			hands="Meg. Gloves +2",
			left_ring="Ilabrat Ring",
			right_ring="Rufescent Ring",
			back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Meg. Chausses +2",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.WS['Swift Blade'].MidACC = set_combine(sets.WS['Swift Blade'],{})
	sets.WS['Swift Blade'].HighACC = set_combine(sets.WS['Swift Blade'].MidACC,{})

	-- Elemental Obi --
	sets.Obi = {}
	sets.Obi.Lightning = {waist='Hachirin-no-Obi'}
	sets.Obi.Water = {waist='Hachirin-no-Obi'}
	sets.Obi.Fire = {waist='Hachirin-no-Obi'}
	sets.Obi.Ice = {waist='Hachirin-no-Obi'}
	sets.Obi.Wind = {waist='Hachirin-no-Obi'}
	sets.Obi.Earth = {waist='Hachirin-no-Obi'}
	sets.Obi.Light = {waist='Hachirin-no-Obi'}
	sets.Obi.Dark = {waist='Hachirin-no-Obi'}

	-- JA Sets --
	sets.JA = {}
	sets.JA["Random Deal"] = {body="Lanun Frac +3"}
	sets.JA.Fold = {hands="Lanun Gants +1"}
	sets.JA["Snake Eye"] = {legs="Lanun Trews"}
	sets.JA["Wild Card"] = {feet="Lanun Bottes +3"}

	-- Waltz Set --
	sets.Waltz = {
			head="Mummu Bonnet +2",
			neck="Unmoving Collar",
			--ear1="Suppanomimi",
			--ear2="Brutal Earring",
			body="Laksa. Frac +3",
			hands={ name="Herculean Gloves", augments={'"Waltz" potency +8%','DEX+4',}},
			ring1="Carb. Ring",
			ring2="Carb. Ring",
			--back="Canny Cape",
			--waist="Windbuffet Belt +1",
			legs={ name="Herculean Trousers", augments={'Accuracy+24','"Waltz" potency +11%','STR+10',}},
			feet="Rawhide Boots"}

	sets.Precast = {
			head="Lanun Tricorne",
			neck="Houyi's Gorget",
			ear1="Suppanomimi",
			ear2="Loquacious Earring",
			body="Meg. Cuirie +2",
			hands="Buremte Gloves",
			ring1="Sirona's Ring",
			ring2="Haoma's Ring",
			back="Solemnity Cape",
			waist="Twilight Belt",
			legs="Adhemar Kecks",
			feet="Rawhide Boots"}
	--Fastcast Set --
	sets.Precast.FastCast = {
			head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
			neck="Voltsurge Torque",
			--ear1="Suppanomimi",
			ear2="Loquacious Earring",
			body={ name="Adhemar Jacket", augments={'HP+80','"Fast Cast"+7','Magic dmg. taken -3',}},
			hands="Leyline Gloves",
			ring1="Lebeche Ring",
			ring2="Prolix Ring",
			--back="Canny Cape",
			legs={ name="Herculean Trousers", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+2','VIT+9','Mag. Acc.+14',}},
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}

	sets.Midcast = {}
	-- Magic Haste Set --
	sets.Midcast.Haste = {
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
			
	-- Cure Set --
	sets.Midcast.Cure = {
			head="Lanun Tricorne",
			neck="Houyi's Gorget",
			ear1="Suppanomimi",
			ear2="Loquacious Earring",
			body="Meg. Cuirie +2",
			hands="Buremte Gloves",
			ring1="Sirona's Ring",
			ring2="Haoma's Ring",
			back="Solemnity Cape",
			waist="Gishdubar Sash",
			legs="Adhemar Kecks",
			feet="Adhemar Gamashes"}
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.type == "CorsairRoll" and buffactive[spell.english] then -- Change Any Rolls To Double-Up When You Have A Roll Up --
		cancel_spell()
		send_command('doubleup')
	elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
		cancel_spell()
		send_command('ThirdEye')
	elseif spell.english == "Meditate" and player.tp > 2900 then -- Cancel Meditate If TP Is Above 2900 --
		cancel_spell()
		add_to_chat(123, spell.name .. ' Canceled: ' .. player.tp)
	elseif spell.action_type == 'Ranged Attack' then
		--if spell.target.distance > 24.9 then -- Cancel Ranged Attack If You Are Out Of Range --
		--	cancel_spell()
		--	add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		--	return
		--else
			if AutoMode == 'ON' and not buffactive.amnesia then -- Auto WS/Triple Shot --
				if player.tp >= 1000 then
					cancel_spell()
					autoWS()
				elseif windower.ffxi.get_ability_recasts()[84] < 1 then
					cancel_spell()
					send_command('TripleShot')
				--end
			end
		end
	elseif spell.type == 'WeaponSkill' and player.status == 'Engaged' then
		if spell.skill == 'Marksmanship' then
			if spell.target.distance > 17+target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		else
			if spell.target.distance > target_distance then
				cancel_spell()
				add_to_chat(123, spell.name..' Canceled: [Out of Range]')
				return
			end
		end
	end
end

function precast(spell,action)
	if spell.action_type == 'Ranged Attack' or spell.type == "WeaponSkill" then
		if player.equipment.ammo == "Animikii Bullet" then -- Cancel Ranged Attack or WS If You Have Animikii Bullet Equipped --
			cancel_spell()
			add_to_chat(123, spell.name .. ' Canceled: [Animikii Bullet Equipped!]')
			return
		else
			local check_ammo
			local check_ammo_count = 1
			if spell.action_type == 'Ranged Attack' then
				check_ammo = player.equipment.ammo
				if player.equipment.ammo == 'empty' or player.inventory[check_ammo].count <= check_ammo_count then
					add_to_chat(123, spell.name..' Canceled: [Out of Ammo]')
					cancel_spell()
					return
				else
					equip(sets.Preshot,(buffactive["Triple Shot"] and {body="Laksa. Frac +3"} or {}))
					if player.inventory[check_ammo].count <= ammo_warning_limit and player.inventory[check_ammo].count > 1 and not warning then
						add_to_chat(8, '***** [Low Ammo Warning!] *****')
						warning = true
					elseif player.inventory[check_ammo].count > ammo_warning_limit and warning then
						warning = false
					end
				end
			elseif spell.type == "WeaponSkill" then
--				if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
--					cancel_spell()
--					add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
--					return
--				else
					equipSet = sets.WS
					if equipSet[spell.english] then
						equipSet = equipSet[spell.english]
					end
					if equipSet[AccArray[AccIndex]] then
						equipSet = equipSet[AccArray[AccIndex]]
					end
					if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
						equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
					end
					if spell.english == "Last Stand" and (player.tp > 2990 or buffactive.Sekkanoki) then -- Equip Altdorf's Earring and Wilhelm's Earring When You Have 3000 TP or Sekkanoki For Last Stand --
						equipSet = set_combine(equipSet,{ear1="Altdorf's Earring",ear2="Wilhelm's Earring"})
					end
					equip(equipSet)
--				end
			end
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
--			if spell.english == "Snake Eye" then -- Auto Double-Up After You Use Snake Eye --
--				send_command('@wait 1;input /ja Double-Up <me>')
--			end
		end
	elseif spell.type == "CorsairRoll" or spell.english == "Double-Up" then
		equip(sets.Rolls)
		if spell.english == "Tactician's Roll" then -- Change Tactician's Roll Equipment Here --
			equip({body="Chasseur's Frac"})
		elseif spell.english == "Caster's Roll" then -- Change Caster's Roll Equipment Here --
			equip({legs="Chasseur's Culottes"})
		elseif spell.english == "Courser's Roll" then -- Change Courser's Roll Equipment Here --
			equip({feet="Chasseur's Bottes +1"})
		elseif spell.english == "Blitzer's Roll" then -- Change Blitzer's Roll Equipment Here --
			equip({head="Chasseur's Tricorne"})
		elseif spell.english == "Allies' Roll" then -- Change Allies' Roll Equipment Here --
			equip({hands="Chasseur's Gants +1"})
		end
	elseif spell.type == "CorsairShot" then
		equipSet = sets.QD
		if ACC_Shots:contains(spell.english) then
			equipSet = sets.QD.HighACC
		else
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if not ACC_Shots:contains(spell.english) and (world.day_element == spell.element or world.weather_element == spell.element) and sets.Obi[spell.element] and Obi == 'ON' then -- Use Obi Toggle To Unlock Elemental Obi --
				equipSet = set_combine(equipSet,sets.Obi[spell.element])
			end
		end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
		if spell.english == 'Utsusemi: Ni' then
			if buffactive['Copy Image (3)'] then
				cancel_spell()
				add_to_chat(123, spell.name .. ' Canceled: [3 Images]')
				return
			else
				equip(sets.Precast.FastCast)
			end
		else
		equip(sets.Precast.FastCast)
		end
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
		equipSet = sets.Midshot
		if equipSet[player.equipment.range] then
			equipSet = equipSet[player.equipment.range]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		--if buffactive["Triple Shot"] then
		--	equipSet = set_combine(equipSet,{body="Chasseur's Frac +1"})
	--	end
		equip(equipSet)
	elseif spell.action_type == 'Magic' then
		if spell.english:startswith('Cur') and spell.english ~= "Cursna" then
			equip(sets.Midcast.Cure)
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 2.8;cancel stoneskin')
			end
			equip(sets.Midcast.Stoneskin)
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english:startswith('Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)'] or buffactive['Copy Image (3)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equip(sets.Midcast.Haste)
		elseif spell.english == 'Stun' then
			equipSet = equip(sets.Midcast.Haste)
		else
			equipSet = equip(sets.Midcast.Haste)
		end
	end
end

function aftercast(spell,action)
	if spell.action_type == 'Ranged Attack' and AutoMode == 'ON' then
		autoRA()
	else
		status_change(player.status)
	end
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.type == 'CorsairRoll' then
			display_roll_info(spell)
		elseif spell.english == 'Light Shot' then -- Sleep Countdown --
			send_command('wait 50;input /echo '..spell.name..' Effect: [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..' Effect: [OFF]')
		end
	end
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT)
	elseif Armor == 'MDT' then
		equip(sets.MDT)
	elseif new == 'Engaged' then
		equipSet = sets.Melee
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
		end
		if world.area:endswith('Adoulin') then
			equipSet = set_combine(equipSet,{body="Councilor's Garb"})
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equip(sets.Idle[IdleArray[IdleIndex]])
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
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C3' then -- Obi Toggle --
		if Obi == 'ON' then
			Obi = 'OFF'
			add_to_chat(123,'Obi: [OFF]')
		else
			Obi = 'ON'
			add_to_chat(158,'Obi: [ON]')
		end
		status_change(player.status)
	elseif command == 'C2' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
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
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
	elseif command == 'C2' then -- Auto RA/WS Toggle. *Don't Rely On This. It Isn't As Fast As Shooting Manually. It Is Mainly For AFK or When You Dualbox* --
		if AutoMode == 'ON' then
			AutoMode = 'OFF'
			add_to_chat(123,'Auto Mode: [OFF]')
		else
			AutoMode = 'ON'
			add_to_chat(158,'Auto Mode: [ON]')
		end
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.ring1 == "Warp Ring" or player.equipment.ring1 == "Capacity Ring" or player.equipment.ring2 == "Warp Ring" or player.equipment.ring2 == "Capacity Ring" then
		disable('ring1','ring2')
--	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
--		disable('back')
	elseif Lock_Main == 'ON' then
		disable('main','sub')
	else
		enable('main','sub','ring1','ring2','back')
	end
end

function autoRA() -- Make Auto RA Delay Adjustment Here --
	local delay = '2.2'
	if spell.type == "WeaponSkill" then
		delay = '2.25'
	else
		if buffactive["Courser's Roll"] then
			delay = '0.7'
		elseif buffactive[581] then -- Flurry II --
			delay = '0.5'
		else
			delay = '1.05'
		end
	end
	send_command('@wait '..delay..'; input /ra <t>')
end

function autoWS()
	send_command('input /ws "'..AutoGunWS..'" <t>')
end

function define_roll_values()
	rolls = {
		CorsairsRoll	= {lucky=5, unlucky=9, bonus="Experience Points"},
		NinjaRoll		= {lucky=4, unlucky=8, bonus="Evasion"},
		HuntersRoll		= {lucky=4, unlucky=8, bonus="Accuracy"},
		ChaosRoll		= {lucky=4, unlucky=8, bonus="Attack"},
		MagussRoll		= {lucky=2, unlucky=6, bonus="Magic Defense"},
		HealersRoll		= {lucky=3, unlucky=7, bonus="Cure Potency Received"},
		PuppetRoll		= {lucky=4, unlucky=8, bonus="Pet Magic Accuracy/Attack"},
		ChoralRoll		= {lucky=2, unlucky=6, bonus="Spell Interruption Rate"},
		MonksRoll		= {lucky=3, unlucky=7, bonus="Subtle Blow"},
		BeastRoll		= {lucky=4, unlucky=8, bonus="Pet Attack"},
		SamuraiRoll		= {lucky=2, unlucky=6, bonus="Store TP"},
		EvokersRoll		= {lucky=5, unlucky=9, bonus="Refresh"},
		RoguesRoll		= {lucky=5, unlucky=9, bonus="Critical Hit Rate"},
		WarlocksRoll	= {lucky=4, unlucky=8, bonus="Magic Accuracy"},
		FightersRoll	= {lucky=5, unlucky=9, bonus="Double Attack Rate"},
		DrachenRoll		= {lucky=3, unlucky=7, bonus="Pet Accuracy"},
		GallantsRoll	= {lucky=3, unlucky=7, bonus="Defense"},
		WizardsRoll		= {lucky=5, unlucky=9, bonus="Magic Attack"},
		DancersRoll		= {lucky=3, unlucky=7, bonus="Regen"},
		ScholarsRoll	= {lucky=2, unlucky=6, bonus="Conserve MP"},
		BoltersRoll		= {lucky=3, unlucky=9, bonus="Movement Speed"},
		CastersRoll		= {lucky=2, unlucky=7, bonus="Fast Cast"},
		CoursersRoll	= {lucky=3, unlucky=9, bonus="Snapshot"},
		BlitzersRoll	= {lucky=4, unlucky=9, bonus="Attack Delay"},
		TacticiansRoll	= {lucky=5, unlucky=8, bonus="Regain"},
		AlliessRoll		= {lucky=3, unlucky=10, bonus="Skillchain Damage"},
		MisersRoll		= {lucky=5, unlucky=7, bonus="Save TP"},
		CompanionsRoll	= {lucky=2, unlucky=10, bonus="Pet Regain and Regen"},
		AvengersRoll	= {lucky=4, unlucky=8, bonus="Counter Rate"}
		}
end

function display_roll_info(spell)
	rollinfo = rolls[(string.gsub((string.gsub(spell.english, "%'+", "")), "%s+", ""))]
	if rollinfo then
		add_to_chat(158, spell.english..' = '..rollinfo.bonus..'. Lucky Roll is '..
		tostring(rollinfo.lucky)..', Unlucky Roll is '..tostring(rollinfo.unlucky)..'.')
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
			
	local missingHP = 0
	local targ

	if spell.target.type == "SELF" then
		targ = alliance[1][1]
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		targ = find_player_in_alliance(spell.target.name)
		local est_max_hp = targ.hp / (targ.hpp/100)
		missingHP = math.floor(est_max_hp - targ.hp)
	end

	if targ then
		if player.sub_job == 'DNC' then
			if missingHP < 40 then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
			else
				newWaltz = 'Curing Waltz III'
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20,['Curing Waltz II'] = 35,['Curing Waltz III'] = 50,['Curing Waltz IV'] = 65,['Curing Waltz V'] = 80}
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
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
		end
		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('wait 0.03;input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(8, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(8,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
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
	if spell_index>1 then
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
	if player.sub_job == 'SAM' then
		set_macro_page(6, 5)
	elseif player.sub_job == 'WHM' then
		set_macro_page(6, 5)
	elseif player.sub_job == 'DNC' then
		set_macro_page(6, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(6, 5)
	elseif player.sub_job == 'RDM' then
		set_macro_page(6, 5)
	elseif player.sub_job == 'WAR' then
		set_macro_page(6, 5)
	elseif player.sub_job == 'DRG' then
		set_macro_page(6, 5)
	else
		set_macro_page(6, 5)
	end
end