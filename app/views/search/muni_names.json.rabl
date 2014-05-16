object false

node do 
	{
		:muni_names => StationArea.pluck(:muni_name).uniq
	}
end