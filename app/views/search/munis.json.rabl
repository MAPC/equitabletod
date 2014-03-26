object false

node do 
	{
		:munis => StationArea.pluck(:muni_name).uniq
	}
end