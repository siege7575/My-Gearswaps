function get_sets()
                AccIndex = 1
                AccArray = {"LowACC","MidACC","HighACC","Aftermath"}
                IdleIndex = 2
                IdleArray = {'Movement', 'Regen','Town'}				-- Default Idle Set Is Movement --
                PreshotIndex = 1
				PreshotArray = {'Any','RDM'}
				Armor = 'None'
                autoRAmode = 0
                target_distance = 5 -- Set Default Distance Here --
                send_command('input /macro book 5;wait .1;input /macro set 1') -- Change Default Macro Book Here --
				send_command('bind ^` gs c flur') --flurry toggle--
				send_command('bind ^- gs c acc') --accuracy toggle--
				send_command('bind ^= gs c pdt') --PDT toggle--
				send_command('bind != gs c mdt') --MDT toggle--
				send_command('bind !- gs c auto') --Gearset update toggle--
				send_command('bind !f12 gs c C6') --Idle Toggle--
                ranged_ws = S{
                                "Hot Shot","Split Shot","Sniper Shot","Slug Shot","Blast Shot","Heavy Shot","Detonator",
                                "Numbing Shot","Last Stand","Coronach","Trueflight","Wildfire","Flaming Arrow",
                                "Piercing Arrow","Dulling Arrow","Sidewinder","Blast Arrow","Arching Arrow",
                                "Empyreal Arrow","Refulgent Arrow","Apex Arrow","Jishnu's Radiance","Namas Arrow"}
								         
                -- Idle/Town Sets --
                sets.Idle = {}
                sets.Idle.Regen = {
								head="Malignance Chapeau",
								neck="Loricate Torque +1",
								ear1="Etiolation Earring",
								ear2="Genmei Earring",
								body="Malignance Tabard",
								hands="Malignance Gloves",
								ring1="Dark Ring",
								ring2="Defending Ring",
								back="Moonbeam Cape",
								waist="Flume Belt",
								legs="Malignance Tights",
								feet="Meg. Jam. +2"}
                sets.Idle.Movement = set_combine(sets.Idle.Regen,{legs="Carmine Cuisses +1"})
				sets.Idle.Town = {
								main="",
								sub="",
								range="",
								ammo="",
								head="Orion Beret +3",
								body="Orion Jerkin +3",
								hands="Adhemar Wrist. +1",
								legs="Adhemar Kecks +1",
								feet="Orion Socks +3",
								neck="Iskur Gorget",
								waist="Kwahu Kachina Belt",
								left_ear="Dedition Earring",
								right_ear="Telos Earring",
								left_ring="Regal Ring",
								right_ring="Dingir Ring",
								back="Moonbeam Cape"}
         
                sets.Gastraphetes = {
								     main={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
								     sub={ name="Malevolence", augments={'INT+9','Mag. Acc.+10','"Mag.Atk.Bns."+9','"Fast Cast"+4',}},
								     range="Gastraphetes",ammo="Quelling Bolt"}				
				sets.Fomalhaut    = {main="Perun +1",sub="Nusku Shield",range="Fomalhaut",ammo="Chrono Bullet"}				
				sets.FailNot      = {main="Kustawi +1",sub="Nusku Shield",range="Fail-Not",ammo="Chrono Arrow"}				
				sets.Annihilator  = {main="Perun +1",sub="Nusku Shield",range="Annihilator",ammo="Chrono Bullet"}				
				sets.Gandiva      = {main="Oneiros Knife",sub="Nusku Shield",range="Gandiva",ammo="Chrono Arrow"}				
				sets.Armageddon   = {main="Perun +1",sub="Nusku Shield",range="Armageddon",ammo="Chrono Bullet"}				
				sets.Yoichinoyumi = {main="Kustawi +1",sub="Nusku Shield",range="Yoichinoyumi",ammo="Artemis's Arrow"}				
				sets.Closeup      = {main="Kustawi +1",sub="Ternion Dagger +1"}
				
				-- Preshot --
				sets.Preshot = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, -- 10
								neck="Scout's gorget +1", -- 2
								body="Amini Caban +1", -- 7% VS
								hands="Carmine Finger Gauntlets +1", -- 8
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}}, -- 2% VS / 10
								legs="Adhemar Kecks", -- 9
								waist="Impulse Belt", -- 2
								feet="Meghanada Jambeaux +2"} -- 10
				
				sets.Preshot['Fail-Not'] = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
                                body="Oshosi Vest",hands="Carmine Fin. Ga. +1",
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
								waist="Impulse Belt",
								legs="Adhemar Kecks",feet="Meg. Jam. +2"}
				sets.Preshot['Fail-Not'].Any = set_combine(sets.Preshot['Fail-Not'],{body="Amini Caban +1",waist="Yemaya Belt"})								
				sets.Preshot['Fail-Not'].RDM = set_combine(sets.Preshot['Fail-Not'].Any,{head="Orion Beret +3",waist="Impulse Belt",feet="Pursuer's Gaiters"})
				
				sets.Preshot.Yoichinoyumi = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
                                body="Oshosi Vest",hands="Carmine Fin. Ga. +1",
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},waist="Impulse Belt",
								legs="Adhemar Kecks",
								feet="Meg. Jam. +2"}				
				sets.Preshot.Yoichinoyumi.Any = set_combine(sets.Preshot.Yoichinoyumi,{body="Amini Caban +1",waist="Yemaya Belt"})								
				sets.Preshot.Yoichinoyumi.RDM = set_combine(sets.Preshot.Yoichinoyumi.Any,{head="Orion Beret +3",waist="Impulse Belt",feet="Pursuer's Gaiters"})
				
				sets.Preshot.Fomalhaut = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}}, -- 10
								neck="Scout's gorget +1", -- 3
								body="Amini Caban +1", -- 7% VS
								hands="Carmine Finger Gauntlets +1", -- 8
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}}, -- 2% VS / 10
								legs="Adhemar Kecks", -- 9
								waist="Impulse Belt", -- 2
								feet="Meghanada Jambeaux +2"} -- 10				
				sets.Preshot.Fomalhaut.Any = set_combine(sets.Preshot.Fomalhaut,{body="Amini Caban +1",waist="Yemaya Belt"})								
				sets.Preshot.Fomalhaut.RDM = set_combine(sets.Preshot.Fomalhaut.Any,{head="Orion Beret +3",waist="Impulse Belt",feet="Pursuer's Gaiters"})

				sets.Preshot.Armageddon = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
                                body="Oshosi Vest",hands="Carmine Fin. Ga. +1",
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
								waist="Impulse Belt",
								legs="Adhemar Kecks",feet="Meg. Jam. +2"}				
				sets.Preshot.Armageddon.Any = set_combine(sets.Preshot.Armageddon,{body="Amini Caban +1",waist="Yemaya Belt"})							
				sets.Preshot.Armageddon.RDM = set_combine(sets.Preshot.Armageddon.Any,{head="Orion Beret +3",waist="Impulse Belt",feet="Pursuer's Gaiters"})
				
				sets.Preshot.Gastraphetes = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
                                body="Amini Caban +1",hands="Carmine Fin. Ga. +1",
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
								waist="Impulse Belt",
								legs="Adhemar Kecks",feet="Meg. Jam. +2"}								
				sets.Preshot.Gastraphetes.Any = set_combine(sets.Preshot.Gastraphetes,{head="Orion Beret +3"})				
				sets.Preshot.Gastraphetes.RDM = set_combine(sets.Preshot.Gastraphetes.Any,{waist="Yemaya Belt",feet="Pursuer's Gaiters"})
				
				sets.Preshot.Annihilator = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
                                body="Oshosi Vest",hands="Carmine Fin. Ga. +1",
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
								waist="Impulse Belt",
								legs="Adhemar Kecks",feet="Meg. Jam. +2"}				
				sets.Preshot.Annihilator.Any = set_combine(sets.Preshot.Annihilator,{body="Amini Caban +1",waist="Yemaya Belt"})				
				sets.Preshot.Annihilator.RDM = set_combine(sets.Preshot.Annihilator.Any,{head="Orion Beret +3",waist="Impulse Belt",feet="Pursuer's Gaiters"})
				
				sets.Preshot.Gandiva = {
								head={ name="Taeon Chapeau", augments={'"Snapshot"+5','"Snapshot"+5',}},
                                body="Oshosi Vest",hands="Carmine Fin. Ga. +1",
								back={ name="Belenus's Cape", augments={'"Snapshot"+10',}},
								waist="Impulse Belt",
								legs="Adhemar Kecks",feet="Meg. Jam. +2"}				
				sets.Preshot.Gandiva.Any = set_combine(sets.Preshot.Gandiva,{body="Amini Caban +1",waist="Yemaya Belt"})				
				sets.Preshot.Gandiva.RDM = set_combine(sets.Preshot.Gandiva.Any,{head="Orion Beret +3",waist="Impulse Belt",feet="Pursuer's Gaiters"})
				
                -- Shooting Base Set --
				sets.Midshot = { 
								head="Arcadian Beret +1",
								neck="Iskur Gorget",
								ear1="Enervating Earring",
								ear2="Telos Earring", 
								body="Malignance Tabard",  -- "Arcadian Jerkin +2", 
								hands="Malignance Gloves", -- "Carmine Finger Gauntlets +1",
								ring1="Ilabrat Ring",  -- "Dingir Ring",
								ring2="Cacoethic Ring +1",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
								waist="Kwahu Kachina Belt", 
								legs="Adhemar Kecks +1", 
								feet="Adhemar Gamashes +1"}				
				sets.Midshot.MidACC = set_combine(sets.Midshot,{ear1="Enervating Earring"})				
				sets.Midshot.HighACC = set_combine(sets.Midshot.MidACC,{head="Orion Beret +3",ring1="Regal Ring",ring2="Cacoethic Ring +1"})
				sets.Midshot.Aftermath = set_combine(sets.Midshot,{body="Arc. Jerkin +1",ear1="Dedition Earring"})
         
                -- Fail-Not Sets --
                sets.Midshot.FailNot = {
                                range="Fail-Not",ammo="Chrono Arrow",
                                head="Arcadian Beret +1",
								neck="Iskur Gorget",
								ear1="Dedition Earring",
								ear2="Telos Earring",
                                body="Orion Jerkin +3",
								hands="Amini Glove. +1",
								ring1="Ilabrat Ring",
								ring2="Dingir Ring",
                                back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
								waist="Kwahu Kachina Belt",
								legs="Adhemar Kecks +1",
								feet={ name="Herculean Boots", augments={'Rng.Acc.+24 Rng.Atk.+24','"Subtle Blow"+10','STR+6','Rng.Acc.+2','Rng.Atk.+15',}}}               
                sets.Midshot.FailNot.MidACC = set_combine(sets.Midshot.FailNot,{ear1="Enervating Earring"})              
                sets.Midshot.FailNot.HighACC = set_combine(sets.Midshot.FailNot.MidACC,{head="Orion Beret +3",ring1="Regal Ring",ring2="Cacoethic Ring +1"})
				sets.Midshot.FailNot.Aftermath = set_combine(sets.Midshot.FailNot,{body="Arc. Jerkin +1",ear1="Dedition Earring"})
				
				-- Yoichinoyumi Sets --
				sets.Midshot.Yoichinoyumi = {
                                range="Yoichinoyumi",ammo="Artemis's Arrow",
                                head="Arcadian Beret +1",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Telos Earring",
                                body="Orion Jerkin +3",hands="Amini Glove. +1",ring1="Ilabrat Ring",ring2="Dingir Ring",
                                back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
								waist="Kwahu Kachina Belt",
								legs="Adhemar Kecks +1",
								feet="Adhe. Gamashes +1"}              
                sets.Midshot.Yoichinoyumi.MidACC = set_combine(sets.Midshot.Yoichinoyumi,{ear1="Enervating Earring"})              
                sets.Midshot.Yoichinoyumi.HighACC = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{head="Orion Beret +3",ring1="Regal Ring",ring2="Cacoethic Ring +1"})
				sets.Midshot.Yoichinoyumi.Aftermath = set_combine(sets.Midshot.Yoichinoyumi,{body="Mummu Jacket +2",hands="Mummu Wrists +2",ring2="Mummu Ring"})
							
				-- Fomalhaut Sets --
                sets.Midshot.Fomalhaut = { 
								head="Arcadian Beret +1",
								neck="Iskur Gorget",
								ear1="Enervating Earring",
								ear2="Telos Earring", 
								body="Malignance Tabard",--"Arcadian Jerkin +2", 
								hands="Malignance Gloves", -- "Carmine Finger Gauntlets +1",
								ring1="Ilabrat Ring",  -- "Dingir Ring",
								ring2="Cacoethic Ring +1",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
								waist="Kwahu Kachina Belt", 
								legs="Adhemar Kecks +1", 
								feet="Adhemar Gamashes +1"}
                sets.Midshot.Fomalhaut.MidACC = set_combine(sets.Midshot.Fomalhaut,{ear1="Enervating Earring"})               
                sets.Midshot.Fomalhaut.HighACC = set_combine(sets.Midshot.Fomalhaut.MidACC,{head="Orion Beret +3",feet="Orion Socks +3",ring1="Cacoethic Ring +1"})
				sets.Midshot.Fomalhaut.Aftermath = set_combine(sets.Midshot.Fomalhaut,{body="Arc. Jerkin +1",ear1="Dedition Earring"})

				-- Gastraphetes Sets --
				sets.Midshot.Gastraphetes = {range="Gastraphetes",head="Arcadian Beret +1",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Telos Earring",body="Orion Jerkin +3",hands="Adhemar Wrist. +1",ring1="Ilabrat Ring",ring2="Rajas Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}               
                sets.Midshot.Gastraphetes.MidACC = set_combine(sets.Midshot.Gastraphetes,{ear1="Enervating Earring"})               
                sets.Midshot.Gastraphetes.HighACC = set_combine(sets.Midshot.Gastraphetes.MidACC,{head="Orion Beret +3",feet="Orion Socks +3",ring1="Cacoethic Ring +1"})
				sets.Midshot.Gastraphetes.Aftermath = set_combine(sets.Midshot.Gastraphetes,{body="Mummu Jacket +2",hands="Mummu Wrists +2",ring2="Mummu Ring"})
				
				-- Annihilator Sets --
				sets.Midshot.Annihilator = {range="Annihilator",ammo="Chrono Bullet",head="Arcadian Beret +1",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Telos Earring",body="Orion Jerkin +3",hands="Adhemar Wrist. +1",ring1="Ilabrat Ring",ring2="Rajas Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
				sets.Midshot.Annihilator.MidACC = set_combine(sets.Midshot.Annihilator,{ear1="Enervating Earring"})				
				sets.Midshot.Annihilator.HighACC = set_combine(sets.Midshot.Annihilator.MidACC,{head="Orion Beret +3",feet="Orion Socks +3",ring2="Cacoethic Ring +1"})				
				sets.Midshot.Annihilator.Aftermath = set_combine(sets.Midshot.Annihilator,{body="Mummu Jacket +2",hands="Mummu Wrists +2",ring2="Mummu Ring"})
				
				-- Gandiva Sets --
				sets.Midshot.Gandiva = {range="Gandiva",head="Arcadian Beret +1",neck="Iskur Gorget",ear1="Dedition Earring",ear2="Telos Earring",body="Orion Jerkin +3",hands="Amini Glove. +1",ring1="Ilabrat Ring",ring2="Regal Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}				
				sets.Midshot.Gandiva.MidACC = set_combine(sets.Midshot.Gandiva,{ear1="Enervating Earring"})				
				sets.Midshot.Gandiva.HighACC = set_combine(sets.Midshot.Gandiva.MidACC,{head="Orion Beret +3",feet="Orion Socks +3",ring1="Cacoethic Ring +1"})				
				sets.Midshot.Gandiva.Aftermath = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}
				
				-- Armageddon Sets --
                sets.Midshot.Armageddon = {
								range="Armageddon",
								ammo="Chrono Bullet",
								head="Arcadian Beret +1",
								neck="Iskur Gorget",
								ear1="Dedition Earring",
								ear2="Telos Earring",
								body="Orion Jerkin +3",
								hands="Adhemar Wrist. +1",
								ring1="Ilabrat Ring",
								ring2="Regal Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
								waist="Yemaya Belt",legs="Adhemar Kecks +1",
								feet="Adhe. Gamashes +1"}               
                sets.Midshot.Armageddon.MidACC =  set_combine(sets.Midshot.Armageddon,{ear1="Enervating Earring"})               
                sets.Midshot.Armageddon.HighACC = set_combine(sets.Midshot.Armageddon.MidACC,{head="Orion Beret +3",feet="Orion Socks +3",ring1="Cacoethic Ring +1"})				
				--sets.Midshot.Armageddon.Aftermath = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"}				
				
                -- Barrage Base Set --
                Barrage = { 
								head="Arcadian Beret +1",
								neck="Iskur Gorget",
								ear1="Enervating Earring",
								ear2="Telos Earring", 
								body="Malignance Tabard",--"Arcadian Jerkin +2", 
								hands="Malignance Gloves", -- "Carmine Finger Gauntlets +1",
								ring1="Cacoethic Ring +1",  -- "Dingir Ring",
								ring2="Ilabrat Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','"Store TP"+10',}},
								waist="Kwahu Kachina Belt", 
								legs="Adhemar Kecks +1", 
								feet="Adhemar Gamashes +1"}
     
                -- Fail-Not Barrage Sets --
                sets.Midshot.FailNot.Barrage = set_combine(sets.Midshot.FailNot, {head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",neck="Iskur Gorget",legs="Adhemar Kecks +1",ring1="Dingir Ring"})                               
                sets.Midshot.FailNot.MidACC.Barrage = set_combine(sets.Midshot.FailNot.MidACC, {
								head="Orion Beret +3",
								body="Orion Jerkin +3",
								hands="Orion Bracers +3",
								ring2="Cacoethic Ring +1",
								ring1="Dingir Ring",
                                legs="Adhemar Kecks +1"})
                sets.Midshot.FailNot.HighACC.Barrage = set_combine(sets.Midshot.FailNot.HighACC, {
								head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring1="Regal Ring",ring2="Cacoethic Ring +1",legs="Adhemar Kecks +1",feet="Orion Socks +3"})
				sets.Midshot.FailNot.Aftermath.Barrage = sets.Midshot.FailNot.Barrage
				
				-- Yoichinoyumi Barrage Sets --
                sets.Midshot.Yoichinoyumi.Barrage = set_combine(sets.Midshot.Yoichinoyumi, {head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",neck="Iskur Gorget",legs="Adhemar Kecks +1",ring1="Dingir Ring"})                              
                sets.Midshot.Yoichinoyumi.MidACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.MidACC, {head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring2="Cacoethic Ring +1",ring1="Dingir Ring",legs="Adhemar Kecks +1",})                               
                sets.Midshot.Yoichinoyumi.HighACC.Barrage = set_combine(sets.Midshot.Yoichinoyumi.HighACC, {head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring1="Regal Ring",ring2="Cacoethic Ring +1",legs="Adhemar Kecks +1",feet="Orion Socks +3"})
				sets.Midshot.Yoichinoyumi.Aftermath.Barrage = sets.Midshot.Yoichinoyumi.Barrage
				
                -- Fomalhaut Barrage Sets --
                sets.Midshot.Fomalhaut.Barrage = set_combine(sets.Midshot.Fomalhaut, {feet="Meg. Jam. +2"})                             
                sets.Midshot.Fomalhaut.MidACC.Barrage = set_combine(sets.Midshot.Fomalhaut.MidACC,{
                                head="Orion Beret +3",
								body="Orion Jerkin +3",
								hands="Orion Bracers +3",
								ring2="Cacoethic Ring +1",
								ring1="Dingir Ring",
                                legs="Adhemar Kecks +1"})								
                sets.Midshot.Fomalhaut.HighACC.Barrage = set_combine(sets.Midshot.Fomalhaut.HighACC,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring1="Regal Ring",ring2="Cacoethic Ring +1",legs="Adhemar Kecks +1",feet="Orion Socks +3"})
				sets.Midshot.Fomalhaut.Aftermath.Barrage = sets.Midshot.Fomalhaut.Barrage
				
				-- Armageddon Barrage Sets --
				sets.Midshot.Armageddon.Barrage = set_combine(sets.Midshot.Armageddon, {head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",neck="Iskur Gorget",legs="Adhemar Kecks +1",ring1="Dingir Ring"})                               
                sets.Midshot.Armageddon.MidACC.Barrage = set_combine(sets.Midshot.Armageddon,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring2="Cacoethic Ring +1",ring1="Dingir Ring",legs="Adhemar Kecks +1"})
                sets.Midshot.Armageddon.HighACC.Barrage = set_combine(sets.Midshot.Armageddon.HighACC,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring1="Regal Ring",ring2="Cacoethic Ring +1",legs="Adhemar Kecks +1",feet="Orion Socks +3"})
				--sets.Midshot.Armageddon.Aftermath.Barrage = sets.Midshot.Armageddon.Barrage
				
				-- Gastraphetes Barrage Sets --
				sets.Midshot.Gastraphetes.Barrage = set_combine(sets.Midshot.Gastraphetes, {head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",neck="Iskur Gorget",legs="Adhemar Kecks +1",ring1="Dingir Ring"})                              
                sets.Midshot.Gastraphetes.MidACC.Barrage = set_combine(sets.Midshot.Gastraphetes.MidACC,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring2="Cacoethic Ring +1",ring1="Dingir Ring",legs="Adhemar Kecks +1"})	
                sets.Midshot.Gastraphetes.HighACC.Barrage = set_combine(sets.Midshot.Gastraphetes.HighACC,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring1="Regal Ring",ring2="Cacoethic Ring +1",legs="Adhemar Kecks +1",feet="Orion Socks +3"})
				sets.Midshot.Gastraphetes.Aftermath.Barrage = sets.Midshot.Gastraphetes.Barrage
               
			    -- Annihilator Barrage Sets --
			    sets.Midshot.Annihilator.Barrage = set_combine(sets.Midshot.Annihilator,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",neck="Iskur Gorget",legs="Adhemar Kecks +1",ring1="Dingir Ring"})			   
			    sets.Midshot.Annihilator.MidACC.Barrage = set_combine(sets.Midshot.Annihilator.MidACC,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring2="Cacoethic Ring +1",ring1="Dingir Ring",legs="Adhemar Kecks +1"})
			    sets.Midshot.Annihilator.HighACC.Barrage = set_combine(sets.Midshot.Annihilator.HighACC,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring1="Regal Ring",ring2="Cacoethic Ring +1",legs="Adhemar Kecks +1",feet="Orion Socks +3"})
			    sets.Midshot.Annihilator.Aftermath.Barrage = sets.Midshot.Annihilator.Barrage
			    --Gandiva Barrage Sets --
			    sets.Midshot.Gandiva.Barrage = set_combine(sets.Midshot.Gandiva, {head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",neck="Iskur Gorget",legs="Adhemar Kecks +1",ring1="Dingir Ring"})
			    sets.Midshot.Gandiva.MidACC.Barrage = set_combine(sets.Midshot.Gandiva,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring2="Cacoethic Ring +1",ring1="Dingir Ring",legs="Adhemar Kecks +1"})
			    sets.Midshot.Gandiva.HighACC.Barrage = set_combine(sets.Midshot.Gandiva.HighACC,{head="Orion Beret +3",body="Orion Jerkin +3",hands="Orion Bracers +3",ring1="Regal Ring",ring2="Cacoethic Ring +1",legs="Adhemar Kecks +1",feet="Orion Socks +3"})
			    sets.Midshot.Gandiva.Aftermath.Barrage = sets.Midshot.Gandiva.Barrage
			   
			    -- Doubleshot Sets --
			    sets.Doubleshot = {head="Oshosi Mask",legs="Oshosi Trousers",feet="Oshosi Leggings"}
			   
			    -- Fail-Not Doubleshot Sets --
			    sets.Midshot.FailNot.Doubleshot = set_combine(sets.Midshot.FailNot,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})	   
			    sets.Midshot.FailNot.MidACC.Doubleshot = set_combine(sets.Midshot.FailNot.MidACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    sets.Midshot.FailNot.HighACC.Doubleshot = set_combine(sets.Midshot.FailNot.HighACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})   
			    sets.Midshot.FailNot.Aftermath.Doubleshot = set_combine(sets.Midshot.FailNot,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			   
			    -- Yoichinoyumi Doubleshot Sets --
			    sets.Midshot.Yoichinoyumi.Doubleshot = set_combine(sets.Midshot.Yoichinoyumi,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    sets.Midshot.Yoichinoyumi.MidACC.Doubleshot = set_combine(sets.Midshot.Yoichinoyumi.MidACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})  
			    sets.Midshot.Yoichinoyumi.HighACC.Doubleshot = set_combine(sets.Midshot.Yoichinoyumi.HighACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    sets.Midshot.Yoichinoyumi.Aftermath.Doubleshot = set_combine(sets.Midshot.Yoichinoyumi.Aftermath,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			   
			    -- Fomalhaut Doubleshot Sets --
			    sets.Midshot.Fomalhaut.Doubleshot = set_combine(sets.Midshot.Fomalhaut,{
								--head="Oshosi Mask",
								body="Oshosi Vest",
								legs="Oshosi Trousers",
								feet="Oshosi Leggings"})
			    sets.Midshot.Fomalhaut.MidACC.Doubleshot = set_combine(sets.Midshot.Fomalhaut.MidACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    sets.Midshot.Fomalhaut.HighACC.Doubleshot = set_combine(sets.Midshot.Fomalhaut.HighACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    sets.Midshot.Fomalhaut.Aftermath.Doubleshot = sets.Midshot.Fomalhaut.Doubleshot
			   
			    -- Armageddon Doubleshot Sets --
			    sets.Midshot.Armageddon.Doubleshot = set_combine(sets.Midshot.Armageddon,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    sets.Midshot.Armageddon.MidACC.Doubleshot = set_combine(sets.Midshot.Armageddon.MidACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    sets.Midshot.Armageddon.HighACC.Doubleshot = set_combine(sets.Midshot.Armageddon.HighACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})
			    --sets.Midshot.Armageddon.Aftermath.Doubleshot = {head="Oshosi Mask",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",body="Oshosi Vest",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Oshosi Trousers",feet="Oshosi Leggings"}
			   
			    --Gastraphetes Doubleshot Sets--
			    sets.Midshot.Gastraphetes.Doubleshot = set_combine(sets.Midshot.Gastraphetes,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Gastraphetes.MidACC.Doubleshot = set_combine(sets.Midshot.Gastraphetes.MidACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Gastraphetes.HighACC.Doubleshot = set_combine(sets.Midshot.Gastraphetes.HighACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Gastraphetes.Aftermath.Doubleshot = {head="Oshosi Mask",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",body="Oshosi Vest",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Oshosi Trousers",feet="Oshosi Leggings"}
			   
			    --Annihilator Doubleshot Sets--
			    sets.Midshot.Annihilator.Doubleshot = set_combine(sets.Midshot.Annihilator,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Annihilator.MidACC.Doubleshot = set_combine(sets.Midshot.Annihilator.MidACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})		   
			    sets.Midshot.Annihilator.HighACC.Doubleshot = set_combine(sets.Midshot.Annihilator.HighACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Annihilator.Aftermath.Doubleshot = {head="Oshosi Mask",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",body="Oshosi Vest",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Oshosi Trousers",feet="Oshosi Leggings"}
			   
			    --Gandiva Doubleshot Sets--
			    sets.Midshot.Gandiva.Doubleshot = set_combine(sets.Midshot.Gandiva,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Gandiva.MidACC.Doubleshot = set_combine(sets.Midshot.Gandiva.MidACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Gandiva.HighACC.Doubleshot = set_combine(sets.Midshot.Gandiva.HighACC,{head="Oshosi Mask",body="Oshosi Vest",legs="Oshosi Trousers",feet="Oshosi Leggings"})			   
			    sets.Midshot.Gandiva.Aftermath.Doubleshot = {head="Oshosi Mask",neck="Iskur Gorget",ear1="Enervating Earring",ear2="Telos Earring",body="Oshosi Vest",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Oshosi Trousers",feet="Oshosi Leggings"}
			   
			    --Gandiva Aftermath Set--			   
			    sets.Midshot.Gandiva.AM = set_combine(sets.Midshot.Gandiva,{head="Meghanada Visor +2",ear1="Enervating Earring",body="Mummu Jacket +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1"})
			   
			    --Camouflage Sets--
			    sets.Midshot.Camouflage = {}		   
			    sets.Midshot.FailNot.Camouflage = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",body="Meghanada Cuirie +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Thereoid Greaves"}			   
			    sets.Midshot.Yoichinoyumi.Camouflage = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",body="Meghanada Cuirie +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Thereoid Greaves"}
			    sets.Midshot.Fomalhaut.Camouflage = set_combine(sets.Midshot.Fomalhaut,{})	   
			    sets.Midshot.Armageddon.Camouflage = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",body="Meghanada Cuirie +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Thereoid Greaves"}			   
			    sets.Midshot.Annihilator.Camouflage = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",body="Meghanada Cuirie +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Thereoid Greaves"}
			    sets.Midshot.Gastraphetes.Camouflage = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",body="Meghanada Cuirie +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Thereoid Greaves"}
			    sets.Midshot.Gandiva.Camouflage = {head="Meghanada Visor +2",neck="Iskur Gorget",ear1="Enervating Earring",body="Meghanada Cuirie +2",hands="Mummu Wrists +2",ring1="Begrudging Ring",ring2="Mummu Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','Crit.hit rate+10',}},waist="Kwahu Kachina Belt",legs="Darraigner's Brais",feet="Thereoid Greaves"}
				
			    -- PDT/MDT Sets --
                sets.PDT = {
								head="Malignance Chapeau",
								neck="Loricate Torque +1",
								ear1="Etiolation Earring",
								ear2="Genmei Earring",
								body="Malignance Tabard",
								hands="Malignance Gloves",
								ring1="Dark Ring",
								ring2="Defending Ring",
								back="Moonbeam Cape",
								waist="Flume Belt",
								legs="Malignance Tights",
								feet="Meg. Jam. +2"}
                sets.MDT = {
								head="Malignance Chapeau",
								neck="Loricate Torque +1",
								ear1="Etiolation Earring",
								ear2="Genmei Earring",
								body="Malignance Tabard",
								hands="Malignance Gloves",
								ring1="Dark Ring",
								ring2="Defending Ring",
								back="Moonbeam Cape",
								waist="Flume Belt",
								legs="Malignance Tights",
								feet="Meg. Jam. +2"}
         
                -- Melee Sets --
                sets.Melee = {
                                head="Adhemar Bonnet +1",
								neck="Erudit. Necklace",
								ear1="Sherida Earring",
								ear2="Telos Earring",
								body="Adhemar Jacket +1",
								hands="Adhemar Wrist. +1",
								ring1="Ilabrat Ring",
								ring2="Epona's Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
								waist="Windbuffet Belt +1",
								legs="Samnuha Tights",
								feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}                               
                sets.Melee.MidACC = set_combine(sets.Melee,{neck="Lissome Necklace",legs="Carmine Cuisses +1"})
                sets.Melee.HighACC = set_combine(sets.Melee.MidACC,{feet="Meg. Jam. +2"})
				sets.Melee.Aftermath = set_combine(sets.Melee,{})
         
                -- WS Base Set --
                sets.WS = {
                                head="Orion Beret +2",
								neck="Fotia Gorget", -- neck="Scout's Gorget +1",
								ear1="Telos Earring",
								ear2="Moonshade Earring",
								body="Meg. Cuirie +2",
								hands="Meg. Gloves +2",
								ring1="Ilabrat Ring",
								ring2="Dingir Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
								waist="Fotia Belt",
								legs="Meg. Chausses +2",
								feet="Meg. Jam. +2"}	
         
                -- WS Sets --
                -- Apex Arrow --
                sets.WS['Apex Arrow'] = set_combine(sets.WS,{
				                head="Orion Beret +3",neck="Fotia Gorget",body={ name="Herculean Vest", augments={'Rng.Acc.+26','Weapon skill damage +3%','AGI+15',}},hands="Meg. Gloves +2",ring1="Dingir Ring",ring2="Ilabrat Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},waist="Fotia Belt",legs={ name="Herculean Trousers", augments={'Weapon skill damage +3%','AGI+10','Rng.Acc.+11','Rng.Atk.+12',}},feet={ name="Herculean Boots", augments={'Rng.Atk.+10','Weapon skill damage +4%','AGI+9','Rng.Acc.+2',}}})           
                sets.WS['Apex Arrow'].MidACC = set_combine(sets.WS["Apex Arrow"],{ring2="Cacoethic Ring +1"})           
                sets.WS['Apex Arrow'].HighACC = set_combine(sets.WS["Apex Arrow"].MidACC,{body="Orion Jerkin +3"})
				sets.WS['Apex Arrow'].Aftermath = sets.WS['Apex Arrow']
				
				-- Namas Arrow Sets --
				sets.WS['Namas Arrow'] = set_combine(sets.WS,{
				                head="Orion Beret +3",neck="Fotia Gorget",body={ name="Herculean Vest", augments={'Rng.Acc.+26','Weapon skill damage +3%','AGI+15',}},hands="Meg. Gloves +2",ring1="Regal Ring",ring2="Ilabrat Ring",back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},waist="Fotia Belt",legs={ name="Herculean Trousers", augments={'Weapon skill damage +3%','AGI+10','Rng.Acc.+11','Rng.Atk.+12',}},feet={ name="Herculean Boots", augments={'Rng.Atk.+10','Weapon skill damage +4%','AGI+9','Rng.Acc.+2',}}})
                sets.WS['Namas Arrow'].MidACC = set_combine(sets.WS["Namas Arrow"],{ring2="Cacoethic Ring +1"})
                sets.WS['Namas Arrow'].HighACC = set_combine(sets.WS["Namas Arrow"].MidACC,{body="Orion Jerkin +3"})
				sets.WS['Namas Arrow'].Aftermath = sets.WS['Namas Arrow']
				
                -- Jishnu's Radiance --
                sets.WS["Jishnu's Radiance"] = set_combine(sets.WS, {
                                head="Adhemar Bonnet +1",
								neck="Fotia Gorget",
								ear1="Sherida Earring",
								ear2="Odr Earring",
								body="Meg. Cuirie +2",
								hands="Mummu Wrists +2",
								ring1="Begrudging Ring",
								ring2="Mummu Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},--back={ name="Belenus's Cape", augments={'DEX+20','Rng.Acc.+20 Rng.Atk.+20','Crit.hit rate+10',}},
								waist="Fotia Belt",
								legs="Mummu Kecks +2",
								feet="Thereoid greaves"})
                sets.WS["Jishnu's Radiance"].MidACC = set_combine(sets.WS	["Jishnu's Radiance"],{feet="Mummu Gamash. +1",ear1="Telos Earring"})
                sets.WS["Jishnu's Radiance"].HighACC = set_combine(sets.WS["Jishnu's Radiance"].MidACC,{})
				sets.WS["Jishnu's Radiance"].Aftermath = sets.WS["Jishnu's Radiance"]
     
                -- Last Stand --
                sets.WS['Last Stand'] = set_combine(sets.WS, {
                                head="Orion Beret +2",
								neck="Fotia Gorget", -- neck="Scout's Gorget +1",
								ear1="Telos Earring",
								ear2="Moonshade Earring",
								body="Meg. Cuirie +2",
								hands="Meg. Gloves +2",
								ring1="Ilabrat Ring",
								ring2="Dingir Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
								waist="Fotia Belt",
								legs="Meg. Chausses +2",
								feet="Meg. Jam. +2"})
                sets.WS['Last Stand'].MidACC = set_combine(sets.WS["Last Stand"],{ring2="Cacoethic Ring +1"})
                sets.WS['Last Stand'].HighACC = set_combine(sets.WS["Last Stand"].MidACC,{body="Orion Jerkin +3"})			
				sets.WS['Last Stand'].Aftermath = sets.WS['Last Stand']
				
				--Coronach--
				sets.WS['Coronach'] = set_combine(sets.WS['Last Stand'], {ring2="Ilabrat Ring",})
				sets.WS['Coronach'].MidACC = set_combine(sets.WS['Last Stand'].MidACC, {ring2="Ilabrat Ring"})
				sets.WS['Coronach'].HighACC = set_combine(sets.WS['Last Stand'].HighACC, {})
				
				-- Trueflight --
				sets.WS['Trueflight'] = {
								head={ name="Herculean Helm", augments={'Mag. Acc.+20 "Mag.Atk.Bns."+20','"Fast Cast"+3','Mag. Acc.+11','"Mag.Atk.Bns."+14',}},
								ear1="Friomisi Earring",
								ear2="Moonshade Earring",
								neck="Sanctity Necklace", neck="Scout's Gorget +1", 
								hands="Carmine Finger Gauntlets +1",
								body="Samnuha Coat",
								ring1="Ilabrat Ring",
								ring2="Dingir Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
								waist="Eschan Stone",
								legs={ name="Herculean Trousers", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Enmity-1','STR+10','"Mag.Atk.Bns."+14',}},
								feet={ name="Herculean Boots", augments={'AGI+4','"Mag.Atk.Bns."+20','Magic Damage +4','Accuracy+11 Attack+11','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}}
				sets.WS['Trueflight'].MidACC = set_combine(sets.WS["Trueflight"],{body="Samnuha Coat",ear1="Digni. Earring"})			
				sets.WS['Trueflight'].HighACC = set_combine(sets.WS["Trueflight"].MidACC,{neck="Sanctity Necklace"})
				sets.WS['Trueflight'].Aftermath = sets.WS['Trueflight']
				
				-- Wildfire --
				sets.WS['Wildfire'] = set_combine(sets.WS["Trueflight"],{ear2="Hecate's Earring"})
				sets.WS['Wildfire'].MidACC = set_combine(sets.WS["Trueflight"].MidACC,{head="Orion Beret +3",ring1="Ilabrat Ring",ear2="Novio earring",hands="Meg. Gloves +2"})
				sets.WS['Wildfire'].HighACC = set_combine(sets.WS["Trueflight"].HighACC,{ring1="Ilabrat Ring",ear2="Novio earring",hands="Meg. Gloves +2"})
				sets.WS['Wildfire'].Aftermath = sets.WS['Wildfire']
				
				sets.WS['Hot Shot'] = set_combine(sets.WS["Trueflight"],{neck="Fotia Gorget",waist="Fotia Belt"})
				sets.WS['Hot Shot'].MidACC = set_combine(sets.WS['Hot Shot'],{legs="Adhemar Kecks +1"})
				sets.WS['Hot Shot'].HighACC = set_combine(sets.WS['Hot Shot'].MidACC,{ear2="Telos Earring"})
				sets.WS['Hot Shot'].Aftermath = sets.WS['Hot Shot']
				
				sets.WS['Savage Blade'] = {
								head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
								neck="Caro Necklace",
								ear1="Moonshade Earring",
								ear2="Sherida Earring",
								body="Meg. Cuirie +2",
								hands="Meg. Gloves +2",
								left_ring="Ilabrat Ring",
								right_ring="Rufescent Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
								waist="Prosilio Belt +1",
								legs="Meg. Chausses +2",
								feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}

				sets.WS['Circle Blade'] = {
								head={ name="Herculean Helm", augments={'Accuracy+19 Attack+19','Weapon skill damage +4%','STR+3','Accuracy+2','Attack+13',}},
								neck="Caro Necklace",
								ear1="Moonshade Earring",
								ear2="Sherida Earring",
								body="Meg. Cuirie +2",
								hands="Meg. Gloves +2",
								left_ring="Ilabrat Ring",
								right_ring="Rufescent Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
								waist="Prosilio Belt +1",
								legs="Meg. Chausses +2",
								feet={ name="Herculean Boots", augments={'Accuracy+16','"Triple Atk."+4','Attack+15',}}}
				
				-- Dagger Weapon Skills --
				sets.WS['Exenterator'] = {
								head="Adhemar Bonnet",
								neck="Fotia Gorget",
								ear1="Infused Earring",
								ear2="Digni. Earring",
								body="Meg. Cuirie +2",
								hands="Mummu Wrists +2",
								ring1="Ilabrat Ring",
								ring2="Regal Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+10','Weapon skill damage +10%',}},
								waist="Fotia Belt",legs="Jokushu Haidate",feet="Thereoid Greaves"}
				sets.WS['Evisceration'] = sets.WS['Exenterator']
		
				sets.WS['Aeolian Edge'] = sets.WS['Hot Shot']
				              
         
                -- JA Sets --
                sets.JA = {}
                sets.JA.Shadowbind = {
                                head="Orion Beret +3",
								neck="Iskur Gorget",
								ear1="Enervating Earring",
								ear2="Telos Earring",
								body="Orion Jerkin +3",
								hands="Orion Bracers +3",
								ring1="Regal Ring",
								ring2="Cacoethic Ring +1",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}},
								waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Meg. Jam. +2"}
         
                sets.JA.Scavenge = {feet="Orion Socks +3"}
                sets.JA.Camouflage = {body="Orion Jerkin +3"}               
                sets.JA.Sharpshot = {legs="Orion Braccae +2"}              
                sets.JA["Bounty Shot"] = {hands="Amini Glove. +1",waist="Chaac Belt", feet="Volte Boots"}               
                sets.JA["Double Shot"] = {head="Amini Gapette +1"}              
                sets.JA["Eagle Eye Shot"] = {
                                head="Orion Beret +2",
								neck="Scout's Gorget +1", -- neck="Fotia Gorget",
								ear1="Telos Earring",
								ear2="Moonshade Earring",
								body="Meg. Cuirie +2",
								hands="Meg. Gloves +2",
								ring1="Regal Ring",
								ring2="Dingir Ring",
								back={ name="Belenus's Cape", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Weapon skill damage +10%',}},
								waist="Fotia Belt",
								legs="Meg. Chausses +2",
								feet="Meg. Jam. +2"}
				sets.JA["Barrage"] = {"Orion Bracers +1"}--set_combine(sets.Midshot, {body="Orion Jerkin +3",hands="Orion Bracers +3",neck="Iskur Gorget",legs="Adhemar Kecks +1",feet="Adhe. Gamashes +1",ring1="Regal Ring",ring2="Cacoethic Ring +1"})
         
                -- Waltz Set --
                sets.Waltz = {head="Mummu Bonnet +1",body="Passion Jacket",}
         
                sets.Precast = {}
                -- Fastcast Set --
                sets.Precast.FastCast = {
                                head="Carmine Mask +1",
								neck="Baetyl Pendant",
								ear1="Loquac. Earring",
								ear2="Etiolation earring",
								body="Samnuha Coat",
								hands="Leyline Gloves",
								ring1="Prolix Ring",
								ring2="Defending Ring",
								waist="Flume Belt",
								legs="Carmine Cuisses +1",
								feet="Carmine Greaves +1"}
                -- Utsusemi Precast Set --
                sets.Precast.Utsusemi = set_combine(sets.Precast.FastCast,{body="Passion Jacket",neck="Magoraga Beads"})
                sets.Midcast = {
                                head="Carmine Mask +1",
								neck="Baetyl Pendant",
								ear1="Loquac. Earring",
								ear2="Etiolation earring",
								body="Samnuha Coat",
								hands="Leyline Gloves",
								ring1="Prolix Ring",
								ring2="Defending Ring",
								waist="Flume Belt",
								legs="Carmine Cuisses +1",
								feet="Carmine Greaves +1"}
               
                -- Magic Haste Set --
                sets.Midcast.Haste = set_combine(sets.PDT,{{
                                head="Carmine Mask +1",
								neck="Baetyl Pendant",
								ear1="Loquac. Earring",
								ear2="Etiolation earring",
								body="Samnuha Coat",
								hands="Leyline Gloves",
								ring1="Prolix Ring",
								ring2="Defending Ring",
								waist="Flume Belt",
								legs="Carmine Cuisses +1",
								feet="Carmine Greaves +1"}})
        end
         
        function pretarget(spell,action)
                if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
                        cancel_spell()
                        send_command('input /item "Echo Drops" <me>')
                elseif spell.english == "Berserk" and buffactive.Berserk then -- Change Berserk To Aggressor If Berserk Is On --
                        cancel_spell()
                        send_command('Aggressor')
                elseif spell.english == "Seigan" and buffactive.Seigan then -- Change Seigan To Third Eye If Seigan Is On --
                        cancel_spell()
                        send_command('ThirdEye')
                elseif spell.english == "Meditate" and player.tp > 290 then -- Cancel Meditate If TP Is Above 290 --
                        cancel_spell()
                        add_to_chat(123, spell.name .. ' Canceled: ['..player.tp..' TP]')
                elseif (spell.english == 'Ranged' and spell.target.distance > 24.9) or (player.status == 'Engaged' and ((ranged_ws:contains(spell.english) and spell.target.distance > 16+target_distance) or (spell.type == "WeaponSkill" and not ranged_ws:contains(spell.english) and spell.target.distance > target_distance))) then -- Cancel Ranged Attack or WS If You Are Out Of Range --
                        cancel_spell()
                        add_to_chat(123, spell.name..' Canceled: [Out of Range]')
                        return
                end
        end
         
        function precast(spell,action)
                if spell.english == 'Ranged' then
					equipSet = sets.Preshot
					add_to_chat(57,"Flurry Level "..PreshotArray[PreshotIndex])
				if buffactive['Flurry'] then
					add_to_chat(122,"Flurry found")
				if PreshotArray[PreshotIndex] == 'RDM' then
				if  equipSet[player.equipment.range].RDM then 
					equipSet =  equipSet[player.equipment.range].RDM
				end
		else
				if  equipSet[player.equipment.range].Any then 
					equipSet =  equipSet[player.equipment.range].Any
		end
		end
		else
				if  equipSet[player.equipment.range] then 
					equipSet =  equipSet[player.equipment.range]
		end
					add_to_chat(122,"No flurry")
		end
   
					equip(equipSet)
			
			
                elseif spell.type == "WeaponSkill" then
									equipSet = sets.WS
                                if equipSet[spell.english] then
                                        equipSet = equipSet[spell.english]
                                end
                                if equipSet[AccArray[AccIndex]] then
                                        equipSet = equipSet[AccArray[AccIndex]]
                                end
                                if player.tp > 2249	 or buffactive.Sekkanoki then
                                        if spell.english == "Last Stand" then -- Equip Telos Earring When You Have 3000 TP or Sekkanoki For Last Stand --
                                                equipSet = set_combine(equipSet,{ear2="Telos Earring"})
                                        elseif spell.english == "Jishnu's Radiance" then -- Equip Telos Earring When You Have 3000 TP or Sekkanoki For Jishnu's Radiance --
                                                equipSet = set_combine(equipSet,{ear2="Telos Earring"})
                                        elseif spell.english == "Trueflight" then --Equip Ishvara Earring When you have 3000 TP or Sekkanoki for Trueflight --
												equipSet = set_combine(equipSet,{ear2="Ishvara Earring"})
										end
                                end
                                equip(equipSet)
                        
						
                elseif spell.type=="JobAbility" then
                        if sets.JA[spell.english] then
                                equip(sets.JA[spell.english])
                        end
                elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
                        if string.find(spell.english,'Utsusemi') then
                                if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
                                        cancel_spell()
                                        add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
                                        return
                                else
                                        equip(sets.Precast.Utsusemi)
                                end
                        else	
                                equip(sets.Precast.FastCast)
                        end
                elseif spell.type == "Waltz" then
                        equip(sets.Waltz)
                elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
                        cast_delay(0.2)
                        send_command('cancel Sneak')
                end
        end
		


		
        function midcast(spell,action)
                if spell.english == 'Ranged' then
                        equipSet = sets.Midshot
                        if equipSet[player.equipment.range] then
                                equipSet = equipSet[player.equipment.range]
                        end
                        if equipSet[AccArray[AccIndex]] then
                                equipSet = equipSet[AccArray[AccIndex]]
                        end
						
						
                        if buffactive.Barrage and equipSet["Barrage"] then
                                equipSet = equipSet["Barrage"]
                        end
						if buffactive['Double Shot'] and equipSet["Doubleshot"] then
								equipSet = equipSet["Doubleshot"]
						end
						if buffactive['Camouflage'] and equipSet["Camouflage"] then
								equipSet = equipSet["Camouflage"]
						end
						
						
						
						
						
                        equip(equipSet)
						
                elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
                        if string.find(spell.english,'Utsusemi') then
                                if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
                                        send_command('@wait 1.7;cancel Copy Image*')
                                end
                                equip(sets.Midcast.Haste)
                        elseif spell.english == 'Monomi: Ichi' then
                                if buffactive['Sneak'] then
                                        send_command('@wait 1.7;cancel sneak')
                                end
                                equip(sets.Midcast.Haste)
                        else
                                equip(sets.Midcast.Haste)
                        end
                
						if spell.english == "Trueflight" and (buffactive['Aurorastorm']) then
						add_to_chat(125,'weather mode') 
						equip({waist="Hachirin-no-Obi"})
					
				end
						if spell.english == "Wildfire" and (buffactive['Firestorm']) then
						add_to_chat(125,'weather mode')
						equip({waist="Hachirin-no-Obi"})
				end
				
		end
    end
 
        
         
        function aftercast(spell,action)
                if spell.english == 'Ranged' and autoRAmode==1 then
                        autoRA()
                elseif spell.type == "WeaponSkill" and not spell.interrupted then
                        send_command('wait 0.2;gs c TP')
                else
                        status_change(player.status)
                end
        end
         
        function status_change(new,old)
                if Armor == 'PDT' then
                        equip(sets.PDT)
                elseif Armor == 'MDT' then
                        equip(sets.MDT)
                elseif new == 'Engaged' then
                        equipSet = sets.Melee
                        if equipSet[AccArray[AccIndex]] then
                                equipSet = equipSet[AccArray[AccIndex]]
                        end
                        equip(equipSet)
                else
                        equip(sets.Idle[IdleArray[IdleIndex]])
                end
        end


         
        -- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
        function self_command(command)
                if command == 'acc' then -- Accuracy Level Toggle --
                        AccIndex = (AccIndex % #AccArray) + 1
                        add_to_chat(158,'Accuracy Level: ' .. AccArray[AccIndex])
                        status_change(player.status)
				elseif command == 'flur' then -- Flurry Level Toggle --
						PreshotIndex = (PreshotIndex % #PreshotArray) + 1
						add_to_chat(158,'Flurry Level: ' ..PreshotArray[PreshotIndex])
						status_change(player.status)
                elseif command == 'auto' then -- Auto Update Gear Toggle --
                        status_change(player.status)
                        add_to_chat(158,'Auto Update Gear')
                elseif command == 'pdt' then -- PDT Toggle --
                        if Armor == 'PDT' then
                                Armor = 'None'
                                add_to_chat(123,'PDT Set: [Unlocked]')
                        else
                                Armor = 'PDT'
                                add_to_chat(158,'PDT Set: [Locked]')
                        end
                        status_change(player.status)
                elseif command == 'mdt' then -- MDT Toggle --
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
                elseif command == 'AutoRA' then -- Auto Ranged Attack Toggle. *Don't Rely On This. It Isn't As Fast As Shooting Manually. It Is Mainly For AFK or When You Dualbox* --
                        if autoRAmode == 0 then
                                autoRAmode = 1
                                add_to_chat(158,'AutoRA Mode: [ON]')
                        else
                                autoRAmode = 0
                                add_to_chat(123,'AutoRA Mode: [OFF]')
                        end
                elseif command == 'TP' then
                        add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
                elseif command:match('^SC%d$') then
                        send_command('//' .. sc_map[command])
                end
        end
         
        function autoRA()
                send_command('@wait 2.5; input /ra <t>')
        end