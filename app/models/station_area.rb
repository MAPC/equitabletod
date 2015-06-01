class StationArea < ActiveRecord::Base

  has_and_belongs_to_many :transit_lines

  def location
    "#{self.latitude} #{self.longitude}"
  end

  # Basic Search

  scope :by_name,      -> name      { where("station_areas.name ~* ?", name) }
  scope :by_muni_name, -> muni_name { where("station_areas.muni_name ~* ?", muni_name) }
  scope :by_line,      -> by_line   { includes(:transit_lines).where("transit_lines.name ~* ?", by_line) }
  
  scope :by_service, -> service_type {
    includes(:transit_lines).where("transit_lines.service_type ~* ?", service_type) }
  
  # TODO: once database is fixed, attr in quotes will be station_type
  scope :by_station_class, -> station_class { where("station_areas.station_class ~* ?", station_class) }
  scope :by_etod_category, -> etod_category { where("station_areas.etod_type ~* ?", etod_category) }

  # Advanced Search
  def self.advanced_scopes
    [{ name: :by_median_income,          field_name: "ov_hhinc"    },
    { name: :by_far,                    field_name: "ov_far"      },
    { name: :by_vmt,                    field_name: "ov_vmthday"  },
    { name: :by_percent_transit,        field_name: "ov_pcttran"  },
    { name: :by_parking_acres,          field_name: "ov_prkac"    },
    { name: :by_employment10,           field_name: "ov_emp10"    },
    { name: :by_tax_revenue,            field_name: "ex_taxrev"   },
    { name: :by_households10,           field_name: "ov_hh10"     },
    { name: :by_vehicle_perhousehold,   field_name: "ov_vehphh"   },
    { name: :by_transit_commutingmiles, field_name: "ov_trnpcmi"  },
    { name: :by_ghg,                    field_name: "ov_ghg"      },
    { name: :by_development_intensity,  field_name: "ov_intntot"  },
    { name: :by_development_mix,        field_name: "ov_mix"      },
    { name: :by_residential_density,    field_name: "hupac"       },
    { name: :by_employment_density,     field_name: "ov_empden"   },
    { name: :by_establishments,         field_name: "ov_est_10"   },
    { name: :by_assessed_value,         field_name: "ov_aval"     },
    { name: :by_renter_occupied,        field_name: "ov_rentocc"  },
    { name: :by_nocar_households,       field_name: "ov_hhnocar"  },
    { name: :by_education_attainment,   field_name: "ov_ed_att"   },
    { name: :by_walkscore,              field_name: "walkscore"   },
    { name: :by_commercial_pipeline,    field_name: "ov_emppipe"  },
    { name: :by_residential_pipeline,   field_name: "ov_hupipe"   }]
  end

  self.advanced_scopes.each do |s|
    scope(s[:name].to_sym, -> min, max { where("#{s[:field_name]} >= ? AND #{s[:field_name]} <= ?", min, max) })
  end

end



