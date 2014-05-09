object false

node do 
	{
		:names => StationArea.pluck(:name).uniq
	}
end