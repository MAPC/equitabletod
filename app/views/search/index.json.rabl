object false

node do 
	{	
		:environment => Rails.env
	}
	{
		:munis => StationArea.pluck(:muni_name).uniq
	}
	{
		:names => StationArea.pluck(:name).uniq
	}
end