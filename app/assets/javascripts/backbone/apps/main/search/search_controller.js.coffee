@Equitabletod.module "MainApp.Search", (Search, App, Backbone, Marionette, $, _) ->
	Search.Controller =

	  	showSimpleSearchForm: ->
            searchargs = App.request 'searcharg:entities'
            gon.fars = [0, 0.18, 0.47, 0.80, 5.79] # _.map features, (key, value) -> key.properties.ov_far 
            gon.hhincs = [22175, 50945, 66066, 83495, 175695] # _.map features, (key, value) -> key.properties.ov_hhinc
            gon.vmts = [0 , 13.05, 21.53, 32.14, 69.07] # _.map features, (key, value) -> key.properties.ov_vmthday
            gon.pcttrans = [0, 0.09, 0.21, 0.33, 0.51] # _.map features, (key, value) -> key.properties.ov_pcttran
            gon.prkacs = [0.15, 21.20, 36.32, 61.13, 153.71] # _.map features, (key, value) -> key.properties.ov_prkac
            gon.emp10s = [14, 1292, 2964, 6784, 156259] # _.map features, (key, value) -> key.properties.ov_emp10
            gon.extaxrevs = [0, 4939410, 10794917, 24272378, 384657111] # _.map features, (key, value) -> key.properties.ex_taxrev
            gon.hh10s = [0, 812, 2815, 5670, 17815] # _.map features, (key, value) -> key.properties.ov_hh10
            gon.vehphhs = [0, 0.549, 0.829, 1.169, 3.838] # _.map features, (key, value) -> key.properties.ov_vehphh
            gon.trnpcmis = [0.022, 1.25, 3.83, 8.97, 28.5] # _.map features, (key, value) -> key.properties.ov_trnpcmi if key.properties.ov_trnpcmi
            gon.ghgs = [0, 6.6, 11.15, 17.15, 75.9] # _.map features, (key, value) -> key.properties.ov_ghg if key.properties.ov_ghg
            gon.intntots = [266, 4562, 10685 , 20854, 171920] # _.map features, (key, value) -> key.properties.ov_intntot if key.properties.ov_intntot
            gon.mixs = [0.0142, 0.2086, 0.346, 0.536, 1] #_.map features, (key, value) -> key.properties.ov_mix if key.properties.ov_mix
            gon.hupacs = [0, 4.62, 13.03, 28.42, 200] # _.map features, (key, value) -> key.properties.ov_hupac if key.properties.ov_hupac
            gon.empdens = [0, 12.102, 20.264, 34.031, 424.07] # _.map features, (key, value) -> key.properties.ov_empden if key.properties.ov_empden
            gon.est10s = [6, 141, 288, 559, 9004] # _.map features, (key, value) -> key.properties.ov_est_10 if key.properties.ov_est_10
            gon.avals = [33567503, 370061347, 924104121, 2384211353, 19066783589] # _.map features, (key, value) -> key.properties.ov_aval if key.properties.ov_aval
            gon.rentoccs = [0, 0.379, 0.584, 0.719, 0.996] # _.map features, (key, value) -> key.properties.ov_rentocc if key.properties.ov_rentocc
            gon.hhnocars = [0, 6.658, 20.144, 36.543, 65.22] # _.map features, (key, value) -> key.properties.ov_hhnocar if key.properties.ov_hhnocar
            gon.edatts = [0.17, 0.44, 0.59, 0.75, 0.90] # _.map features, (key, value) -> key.properties.ov_ed_att if key.properties.ov_ed_att
            gon.walkscores = [9.21, 55.25, 70.87, 83.17, 95.27] # _.map features, (key, value) -> key.properties.walkscore if key.properties.walkscore
            gon.hupipes = [0, 0, 0, 295.5, 4719] # _.map features, (key, value) -> key.properties.ov_hupipe if key.properties.ov_hupipe
            gon.emppipes = [0, 0, 0, 134.74, 16588] # _.map features, (key, value) -> key.properties.ov_emppipe if key.properties.ov_emppipe
	  		
            simpleSearchForm = @getSimpleSearchView searchargs
            App.mainRegion.show simpleSearchForm

	  	getSimpleSearchView: (searchargs) ->
	  		new Search.SimpleSearchFormLayout
	  			collection: searchargs

	  	

