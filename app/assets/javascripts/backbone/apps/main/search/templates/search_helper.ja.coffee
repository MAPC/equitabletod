moduleKeywords = ['extended', 'included']
class LookupModule
	@extend: (obj) ->
		for key, value of obj when key not in moduleKeywords
			@[key] = value

		obj.extended?.apply(@)
		this

	@includ: (obj) ->
		for key, value of obj when key not in moduleKeywords
			@::[key] = value

		obj.included?.apply(@)
		this
