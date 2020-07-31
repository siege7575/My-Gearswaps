-- *** Credit goes to Flippant for helping me with Gearswap *** --
-- ** I Use Some of Motenten's Functions ** --

function get_sets()
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- 3 Levels Of Accuracy Sets For TP/WS/Hybrid. Default ACC Set Is LowACC. The First TP Set Of Your Main Weapon Is LowACC. Add More ACC Sets If Needed Then Create Your New ACC Below --
	IdleIndex = 1
	IdleArray = {"Movement","Regen","Refresh"} -- Default Idle Set Is Movement --
	Armor = 'None'
	target_distance = 5 -- Set Default Distance Here --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	Curaga_Spells = {"Curaga","Curaga II"} -- Curaga Degradation --
	select_default_macro_book() -- Change Default Macro Book At The End --

	sc_map = {SC1="ChantduCygne", SC2="Berserk", SC3="HeadButt"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --

	-- Physical Type BlueMagic --
	Physical_BlueMagic = S{
			'Asuran Claws','Bludgeon','Body Slam','Feather Storm','Mandibular Bite',
			'Queasyshroom','Power Attack','Ram Charge','Screwdriver','Sickle Slash',
			'Smite of Rage','Spinal Cleave','Spiral Spin','Sweeping Gouge','Terror Touch'}

	-- Physical Type BlueMagic: STR Modifier --
	Physical_BlueMagic_STR = S{
			'Battle Dance','Bloodrake','Death Scissors','Dimensional Death','Empty Thrash',
			'Heavy Strike','Quadrastrike','Uppercut','Tourbillion','Vertical Cleave',
			'Whirl of Rage'}

	-- Physical Type BlueMagic: STR + DEX Modifiers --
	Physical_BlueMagic_DEX = S{
			'Amorphic Spikes','Barbed Crescent','Claw Cyclone','Disseverment','Foot Kick',
			'Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad','Seedspray',
			'Sinker Drill','Thrashing Assault','Vanity Dive'}

	-- Physical Type BlueMagic: STR + VIT Modifiers --
	Physical_BlueMagic_VIT = S{
			'Cannonball','Glutinous Dart','Grand Slam','Quad. Continuum',
			'Sprout Smack'}

	-- Physical Type BlueMagic: STR + AGI Modifiers --
	Physical_BlueMagic_AGI = S{
			'Benthic Typhoon','Helldive','Hydro Shot','Jet Stream','Pinecone Bomb',
			'Wild Oats'}

	-- Magical Type BlueMagic --
	Magical_BlueMagic = S{
			'Acrid Stream','Atra. Libations','Dark Orb','Droning Whirlwind','Embalming Earth','Cursed Sphere',
			'Evryone. Grudge','Firespit','Foul Waters','Gates of Hades','Leafstorm','Subduction','Eyes On Me',
			'Magic Hammer','Molting Plumage','Nectarous Deluge','Rail Cannon','Regurgitation','Blazing Bound',
			'Rending Deluge','Self-Destruct','Tem. Upheaval','Thermal Pulse','Water Bomb','Tenebral Crush','Entomb','Anvil Lightning',
			'Spectral Floe','Charged Whisker','Retinal Glare','Searing Tempest'}

	-- Low Accuracy Type BlueMagic --
	BlueMagic_Accuracy = S{
			'1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
			'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
			'Cimicine Discharge','Cold Wave','Digest','Corrosive Ooze','Demoralizing Roar',
			'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
			'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance','Lowing',
			'Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind','Sandspin',
			'Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas','Sub-zero Smash',
			'Triumphant Roar','Venom Shell','Voracious Trunk','Yawn','Delta Thrust','Silent Storm'}

	-- Breath Type BlueMagic --
	BlueMagic_Breath = S{
			'Bad Breath','Diffusion Ray','Flying Hip Press','Final Sting','Frost Breath',
			'Heat Breath','Magnetite Cloud','Poison Breath','Radiant Breath','Thunder Breath',
			'Vapor Spray','Wind Breath'}

	-- Buff Type BlueMagic --
	BlueMagic_Buff = S{
			'Barrier Tusk','Carcharian Verve','Diamondhide','Metallic Body','Magic Barrier',
			"Occultation",'Orcish Counterstance',"Nature's Meditation",'Plasma Charge',
			'Pyric Bulwark','Reactor Cool','Mighty Guard','Erratic Flutter','Cocoon'}

	-- Diffusion Compatible Type BlueMagic --
	BlueMagic_Diffusion = S{
			'Amplification','Cocoon','Erratic Flutter','Exuviation','Feather Barrier',
			'Harden Shell','Memento Mori','Metallic Body','Plasma Charge','Reactor Cool',
			'Refueling','Saline Coat','Warm-Up','Zephyr Mantle','Mighty Guard','Carcharian Verve'}

	-- Healing Type BlueMagic --
	BlueMagic_Healing = S{
			'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
			'Wild Carrot'}

	-- Stun Type BlueMagic --
	BlueMagic_Stun = S{
			'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
			'Thunderbolt','Whirl of Rage'}

	-- Unbridled Learning Type BlueMagic --
	BlueMagic_Unbridled = S{
			'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve',
			'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Polar Roar',
			'Pyric Bulwark','Thunderbolt','Tourbillion','Uproot','Mighty Guard'}

	sets.Idle = {
			head="Rawhide Mask",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Infused Earring",
			body="Jhakri Robe +2",
			hands={ name="Herculean Gloves", augments={'Accuracy+21','"Triple Atk."+4','AGI+10',}},
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Flume Belt",
			legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			head="Malignance Chapeau",
			neck="Loricate Torque +1",
			ear1="Eabani Earring",
			ear2="Infused Earring",
			body="Jhakri Robe +2",
			hands="Malignance Gloves",
			left_ring="Dark Ring",
			right_ring="Defending Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Flume Belt",
			legs="Malignance Tights", --legs={ name="Lengo Pants", augments={'INT+10','Mag. Acc.+15','"Mag.Atk.Bns."+15','"Refresh"+1',}},
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{})
	sets.Resting = set_combine(sets.Idle.Regen)

	-- Normal TP Sets --
	sets.TP = {
			ammo="Ginsen",
			head="Adhemar Bonnet +1",
			neck="Mirage Stole +2",
			ear1="Brutal Earring",
			ear2="Telos Earring",
			body="Adhemar Jacket +1",
			hands="Adhemar Wrist. +1",--{ name="Herculean Gloves", augments={'Accuracy+21','"Triple Atk."+4','AGI+10',}},
			left_ring="Hetairoi Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
			waist="Windbuffet Belt +1",
			legs="Samnuha Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.TP.MidACC = set_combine(sets.TP,{legs="Malignance Tights",})
	sets.TP.HighACC = set_combine(sets.TP.MidACC,{})

	-- March x2 + Haste --
	-- Embrava + (March or ) --
	-- Geo Haste + (March or Haste or Embrava) --
	sets.TP.HighHaste =  set_combine(sets.TP,{})
	sets.TP.MidACC.HighHaste = set_combine(sets.TP.HighHaste,{})
	sets.TP.HighACC.HighHaste = set_combine(sets.TP.MidACC.HighHaste,{})

	-- PDT/MDT Sets --
	sets.PDT = {}

	sets.MDT = set_combine(sets.PDT,{})

	-- Hybrid Sets --
	sets.TP.Hybrid = {
				ammo="Ginsen",
				head="Malignance Chapeau",
				neck="Mirage Stole +2",
				ear1="Suppanomimi",
				ear2="Telos Earring",
				body="Malignance Tabard",
				hands="Malignance Gloves",
				ring1="Defending Ring",
				ring2="Epona's Ring",
				back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
				waist="Reiki Yotai",
				legs="Malignance Tights",
				feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid.LowACC,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	-- WS Base Set --
	sets.WS = {
			ammo="Expeditious Pinion",
			head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
			neck="Fotia Gorget",
			ear1="Dignitary's Earring",
			ear2="Brutal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Gloves +1",
			left_ring="Ilabrat Ring",
			right_ring="Rufescent Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Prosilio Belt +1",
			legs="Luhlaza Shalwar +3",
			feet={ name="Herculean Boots", augments={'Accuracy+29','Crit.hit rate+5','STR+9','Attack+5',}}}

	sets.WS["Savage Blade"] = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
			neck="Mirage Stole +2",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Gloves +1",
			left_ring="Ilabrat Ring",
			right_ring="Rufescent Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Luhlaza Shalwar +3",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
			
	sets.WS["Black Halo"] = sets.WS["Savage Blade"]	
	-- WS Sets --
	sets.WS["Chant du Cygne"] = {
			ammo="Expeditious Pinion",
			head="Adhemar Bonnet +1",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Odr Earring",
			body={ name="Herculean Vest", augments={'Accuracy+15 Attack+15','Crit.hit rate+3','DEX+15','Accuracy+6',}},
			hands="Adhemar Wrist. +1",
			left_ring="Begrudging Ring",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
			waist="Fotia Belt",
			legs="Samnuha Tights",-- { name="Herculean Trousers", augments={'Accuracy+25','Crit.hit rate+4','DEX+10','Attack+7',}},
			feet={ name="Herculean Boots", augments={'Accuracy+29','Crit.hit rate+5','STR+9','Attack+5',}}}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{})

	sets.WS.Requiescat = {
			head="Jhakri Coronal +2",
			neck="Fotia Gorget",
			ear1="Mache Earring",
			ear2="Mache Earring",
			body="Adhemar Jacket +1",
			hands={ name="Herculean Gloves", augments={'Accuracy+21','"Triple Atk."+4','AGI+10',}},
			left_ring="Ramuh Ring +1",
			right_ring="Epona's Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Samnuha Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{})

	sets.WS.Expiacion = {
			ammo="Ginsen",
			head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Assim. Jubbah +3",
			hands="Jhakri Gloves +1",
			left_ring="Ilabrat Ring",
			right_ring="Rufescent Ring",
			back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Fotia Belt",
			legs="Luhlaza Shalwar +3",
			feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
	sets.WS.Expiacion.MidACC = set_combine(sets.WS.Expiacion,{})
	sets.WS.Expiacion.HighACC = set_combine(sets.WS.Expiacion.MidACC,{})
	
	sets.WS["Flash Nova"] = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			ear1="Friomisi Earring",
			ear2="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Strendu Ring",
			right_ring="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Eschan Stone",
			legs="Luhlaza Shalwar +3",
			feet="Jhakri Pigaches +2"}

	sets.JA = {}
	-- JA Sets --
	sets.JA['Azure Lore'] = {hands="Luh. Bazubands +1"}

	sets['Chain Affinity'] = {body="Hashishin Kavuk +1"}

	sets.Efflux = {legs="Hashishin Tayt +1"}

	sets['Burst Affinity'] = {feet="Hashi. Basmak +1"}

	sets.Convergence = {head="Luh. Keffiyeh +1"}

	sets.Diffusion = {feet="Luhlaza Charuqs +1"}

	-- Waltz Set --
	sets.Waltz = {}

	sets.Precast = {}
	-- Fastcast Set --
	sets.Precast.FastCast = {
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}}, --14
			neck="Voltsurge Torque", -- 4
			ear1="Mendicant's Earring", 
			ear2="Loquacious Earring", -- 2
			body="Adhemar Jacket", -- 7
			hands={ name="Leyline Gloves", augments={'Accuracy+12','Mag. Acc.+14','"Mag.Atk.Bns."+15','"Fast Cast"+2',}}, -- 7
			left_ring="Prolix Ring", -- 2
			right_ring="Kishar Ring", -- 4
			back="Swith Cape +1", -- 4
			waist="Witful Belt", -- 3
			legs={ name="Psycloth Lappas", augments={'MP+80','Mag. Acc.+15','"Fast Cast"+7',}}, -- 7
			feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}}} -- 8 = 62 total
	
	-- Utsusemi Precast Set --
	sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{neck="Magoraga Bead Necklace"})

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Siegel Sash"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Magic Haste Set --
	sets.Midcast.Haste = set_combine(sets.Precast.FastCast,{
			ammo="Pemphredo Tathlum",
			head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			neck="Incanter's Torque",
			ear1="Mendicant's Earring",
			ear2="Gifted Earring",
			body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			hands={ name="Telchine Gloves", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
			ring1="Evanescence Ring",
			ring2="Defending Ring",
			back="Solemnity Cape",
			waist="Austerity Belt +1",
			legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			feet={ name="Telchine Pigaches", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}})

	-- Enhancing Magic Base Set --
	sets.Midcast['Enhancing Magic'] = {
			ammo="Pemphredo Tathlum",
			head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			neck="Incanter's Torque",
			ear1="Mendicant's Earring",
			ear2="Gifted Earring",
			body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			hands={ name="Telchine Gloves", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
			ring1="Evanescence Ring",
			ring2="Defending Ring",
			back="Solemnity Cape",
			waist="Austerity Belt +1",
			legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			feet={ name="Telchine Pigaches", augments={'"Fast Cast"+4','Enh. Mag. eff. dur. +10',}}}

	-- Stoneskin Set --
	sets.Midcast.Stoneskin = set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Cure/Curaga Spells & Healing Type BlueMagic --
	sets.Midcast.Cure = {
			head="Telchine Cap",
			neck="Incanter's Torque",
			ear1="Mendicant's Earring", -- 5
			ear2="Gifted Earring",
			body="Vrikodara Jupon", -- 13
			hands="Telchine Gloves", -- 10
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Solemnity Cape", -- 7
			waist="Gishdubar Sash", -- 10 received
			legs="Lengo Pants", -- 5
			feet="Medium's Sabots"} -- 10
			--Cure Potency total: 50% + 10% received

	-- Physical Type BlueMagic --
	sets.Midcast.Physical_BlueMagic = {
			ammo="Expeditious Pinion",
			head="Adhemar Bonnet +1",
			neck="Caro Necklace",
			ear1="Mache Earring",
			ear2="Mache Earring",
			body="Jhakri Robe +2",
			hands="Adhemar Gloves",
			left_ring="Ilabrat Ring",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Eschan Stone",
			legs="Carmine Cuisses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+29','Crit.hit rate+5','STR+9','Attack+5',}}}

	-- Physical Type BlueMagic: STR Modifier --
	sets.Midcast.Physical_BlueMagic_STR = set_combine(sets.Midcast.Physical_BlueMagic,{})

	-- Physical Type BlueMagic: STR/DEX Modifiers --
	sets.Midcast.Physical_BlueMagic_DEX = set_combine(sets.Midcast.Physical_BlueMagic,{
			ammo="Expeditious Pinion",
			head="Adhemar Bonnet +1",
			neck="Caro Necklace",
			ear1="Mache Earring",
			ear2="Mache Earring",
			body="Jhakri Robe +2",
			hands="Adhemar Gloves",
			left_ring="Ilabrat Ring",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Eschan Stone",
			legs="Samnuha Tights",
			feet={ name="Herculean Boots", augments={'Accuracy+29','Crit.hit rate+5','STR+9','Attack+5',}}})

	-- Physical Type BlueMagic: STR/VIT Modifiers --
	sets.Midcast.Physical_BlueMagic_VIT = set_combine(sets.Midcast.Physical_BlueMagic,{
			ammo="Expeditious Pinion",
			head="Adhemar Bonnet +1",
			neck="Caro Necklace",
			ear1="Mache Earring",
			ear2="Mache Earring",
			body="Jhakri Robe +2",
			hands="Adhemar Gloves",
			left_ring="Ilabrat Ring",
			right_ring="Ramuh Ring +1",
			back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
			waist="Eschan Stone",
			legs="Carmine Cuisses +1",
			feet={ name="Herculean Boots", augments={'Accuracy+29','Crit.hit rate+5','STR+9','Attack+5',}}})

	-- Physical Type BlueMagic: STR/AGI Modifiers --
	sets.Midcast.Physical_BlueMagic_AGI = set_combine(sets.Midcast.Physical_BlueMagic,{})

	-- Magical Type BlueMagic --
	sets.Midcast.Magical_BlueMagic = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			ear1="Friomisi Earring",
			ear2="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Strendu Ring",
			right_ring="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Eschan Stone",
			legs="Luhlaza Shalwar +3",
			feet="Jhakri Pigaches +2"}
			
	-- Tenebral Crush --
	sets.Midcast.TenebralCrush = set_combine(sets.Midcast.Magical_BlueMagic,{
			--head="Pixie Hairpin +1",
			left_ring="Archon Ring",
			waist="Hachirin-no-Obi"})

	-- Low Accuracy Type BlueMagic --
	sets.Midcast.BlueMagic_Accuracy = {
			ammo="Pemphredo Tathlum",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Sanctity Necklace",
			ear1="Gwati Earring",
			ear2="Dignitary's Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Cornflower Cape",
			waist="Eschan Stone",
			legs="Luhlaza Shalwar +3",
			feet="Jhakri Pigaches +2"}

	-- Stun Type BlueMagic --
	sets.Midcast.BlueMagic_Stun = set_combine(sets.Midcast.BlueMagic_Accuracy,{
			ammo="Pemphredo Tathlum",
			head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
			neck="Sanctity Necklace",
			ear1="Gwati Earring",
			ear2="Dignitary's Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Stikini Ring",
			right_ring="Stikini Ring",
			back="Cornflower Cape",
			waist="Eschan Stone",
			legs="Luhlaza Shalwar +3",
			feet="Jhakri Pigaches +2"})

	-- Buff Type BlueMagic --
	sets.Midcast.BlueMagic_Buff = {
			ammo="Pemphredo Tathlum",
			head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
			neck="Incanter's Torque",
			ear1="Mendicant's Earring",
			ear2="Gifted Earring",
			body="Vedic Coat",
			hands={ name="Telchine Gloves", augments={'"Conserve MP"+4','Enh. Mag. eff. dur. +10',}},
			ring1="Stikini Ring +1",
			ring2="Stikini Ring",
			back="Solemnity Cape",
			waist="Austerity Belt +1",
			legs="Lengo Pants",
			feet="Carmine Greaves +1"}

	-- Breath Type BlueMagic --
	sets.Midcast.BlueMagic_Breath = {
			ammo="Pemphredo Tathlum",
			head="Jhakri Coronal +2",
			neck="Sanctity Necklace",
			ear1="Friomisi Earring",
			ear2="Regal Earring",
			body="Jhakri Robe +2",
			hands="Jhakri Cuffs +2",
			left_ring="Strendu Ring",
			right_ring="Shiva Ring +1",
			back="Cornflower Cape",
			waist="Eschan Stone",
			legs="Luhlaza Shalwar +3",
			feet="Jhakri Pigaches +2"}

	-- BlueMagic Base Set For Any Non Listed BlueMagic --
	sets.Midcast['Blue Magic'] = {}

	-- Charged Whisker --
	sets.Midcast['Charged Whisker'] = set_combine(sets.Midcast.Magical_BlueMagic,{})
	
	-- Battery Charge --
	sets.Midcast['Battery Charge'] = set_combine(sets.Midcast.BlueMagic_Buff,{
			head="Amalric Coif",
			waist="Gishdubar Sash",
			back="Grapevine Cape"})
			
	-- Nature's Meditation --
	sets.Midcast["Nature's Meditation"] = set_combine(sets.Midcast.BlueMagic_Buff,{})
end

function pretarget(spell,action)
	if spell.action_type == 'Magic' and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
		cancel_spell()
		send_command('Aggressor')
	elseif BlueMagic_Unbridled:contains(spell.english) and not buffactive['Unbridled Learning'] then
		if windower.ffxi.get_ability_recasts()[81] < 1 and not buffactive.amnesia and not buffactive.charm then -- Auto Use Unbridled Learning When You Cast One of The Unbridled Spells.
			cancel_spell()
			send_command('input /ja "Unbridled Learning" <me>;wait 1.5;input /ma "'..spell.english..'" '..spell.target.name)
		end
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english:ifind("Curaga") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Curaga_Spells)
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
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
			if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
				equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
			end
			if spell.english == "Chant du Cygne" and player.tp > 2990 then
				equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.action_type == 'Magic' then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
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
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
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
	equipSet = {}
	if spell.action_type == 'Magic' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (spell.english:startswith('Cur') or BlueMagic_Healing:contains(spell.english)) and spell.english ~= "Cursna" then
			if spell.english:startswith('Cure') or BlueMagic_Healing:contains(spell.english) then
				equipSet = equipSet.Cure
			elseif spell.english:startswith('Cura') then
				equipSet = equipSet.Curaga
			end
			if world.day_element == spell.element or world.weather_element == spell.element then
				equipSet = set_combine(equipSet,{back="Twilight Cape",waist="Hachirin-no-Obi"})
			end
		elseif BlueMagic_Diffusion:contains(spell.english) and buffactive['Diffusion'] then
			equipSet = set_combine(equipSet,sets.Diffusion)
		elseif spell.english:startswith('Tenebral') then
			equipSet = equipSet.TenebralCrush
		elseif Physical_BlueMagic:contains(spell.english) or Physical_BlueMagic_STR:contains(spell.english) or Physical_BlueMagic_DEX:contains(spell.english) or Physical_BlueMagic_VIT:contains(spell.english) or Physical_BlueMagic_AGI:contains(spell.english) then
			if Physical_BlueMagic_STR:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_STR
			elseif Physical_BlueMagic_DEX:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_DEX
			elseif Physical_BlueMagic_VIT:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_VIT
			elseif Physical_BlueMagic_AGI:contains(spell.english) then
				equipSet = equipSet.PhysicalBlueMagic_AGI
			elseif Physical_BlueMagic:contains(spell.english) then
				equipSet = equipSet.Physical_BlueMagic
			end
			if buffactive['Chain Affinity'] then
				equipSet = set_combine(equipSet,sets['Chain Affinity'])
			end
			if buffactive.Efflux then
				equipSet = set_combine(equipSet,sets.Efflux)
			end
		elseif Magical_BlueMagic:contains(spell.english) or spell.english == "Charged Whisker" then
			if Magical_BlueMagic:contains(spell.english) then
				equipSet = equipSet.Magical_BlueMagic
			elseif spell.english == "Charged Whisker" then
				equipSet = equipSet[spell.name]
			end
			if buffactive['Burst Affinity'] then
				equipSet = set_combine(equipSet,sets['Burst Affinity'])
			end
			if buffactive.Convergence then
				equipSet = set_combine(equipSet,sets.Convergence)
			end
		elseif BlueMagic_Accuracy:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Accuracy
		elseif BlueMagic_Stun:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Stun
		elseif BlueMagic_Buff:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Buff
		elseif BlueMagic_Breath:contains(spell.english) then
			equipSet = equipSet.BlueMagic_Breath
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
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
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
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if (buffactive.Embrava and (buffactive.March or buffactive.Haste)) or (buffactive.March == 2 and buffactive.Haste) or (buffactive[580] and (buffactive.March or buffactive.Haste or buffactive.Embrava)) and equipSet["HighHaste"] then
			equipSet = equipSet["HighHaste"]
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
			equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
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
		add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
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
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		add_to_chat(158,'Idle Set: ' .. IdleArray[IdleIndex])
		status_change(player.status)
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('left_ring','right_ring')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	else
		enable('left_ring','right_ring','back')
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
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
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
		set_macro_page(1, 19)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 19)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 19)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 19)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 19)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 19)
	else
		set_macro_page(1, 19)
	end
end