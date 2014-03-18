class CreateStationAreas < ActiveRecord::Migration

  def change

    create_table :station_areas do |t|

      t.string  :name
      
      t.string  :muni_name
      t.integer :muni_id
      
      t.decimal :latitude
      t.decimal :longitude
      
      t.integer :community_type_id
      t.string  :community_type_description
      t.integer :subcommunity_type_id
      t.string  :subcommunity_type_description
      t.string  :station_class

      t.decimal :ov_area
      t.decimal :ex_area
      t.decimal :ex_aval
      t.decimal :ov_aval
      t.decimal :ov_comac
      t.decimal :ex_comac
      t.decimal :ov_compc
      t.decimal :ov_comprk
      t.decimal :ex_comprk
      t.decimal :ov_dvothac
      t.decimal :ex_dvothac
      t.decimal :ov_dvothpc
      t.decimal :ov_dvotprk
      t.decimal :ex_dvotprk
      t.decimal :ov_ed_att

      t.integer :ov_emp10
      t.integer :ex_emp10
      
      t.decimal :ov_empcons
      t.decimal :ex_empcons
      t.decimal :ov_empden
      t.decimal :ov_empplan
      t.decimal :ex_empplan

      t.integer :ov_est_10
      t.integer :ex_est_10
      
      t.decimal :ov_far
      t.decimal :ov_ghg
      t.decimal :ex_ghg
      t.integer :ov_hh10
      t.decimal :ex_hh10
      t.decimal :ov_hhnocar
      t.decimal :ov_hhinc
      t.decimal :ov_hresac
      t.decimal :ex_hresac
      t.decimal :ov_hrespc
      t.decimal :ov_hrspkac
      t.decimal :ex_hrspkac
      t.decimal :ov_hu10
      t.decimal :ex_hu10
      t.decimal :ov_hu_0010
      t.decimal :ex_hu_0010

      t.integer :ov_hucons
      t.decimal :ex_hucons
      
      t.decimal :ov_hupac
      t.decimal :ov_huplan
      t.decimal :ex_huplan
      t.decimal :ov_intnpac
      t.decimal :ov_intntot
      t.decimal :ov_jobacc
      t.decimal :ov_lresac
      t.decimal :ex_lresac
      t.decimal :ov_lrespc
      t.decimal :ov_mix
      t.decimal :ov_pct_abc
      t.decimal :ov_pcttran
      t.decimal :ov_pop_0010
      t.decimal :ex_pop_0010
      t.decimal :ov_pop10
      t.decimal :ex_pop10
      t.decimal :ex_prkac
      t.decimal :ov_prkac
      t.decimal :ov_prkpc
      t.decimal :ov_rentocc
      t.decimal :ov_respc
      t.decimal :ov_taxrev
      t.decimal :ex_taxrev
      t.decimal :ov_trnpcmi
      t.decimal :ov_vacdvac
      t.decimal :ex_vacdvac
      t.decimal :ov_vacdvpc
      t.decimal :ov_vacunac
      t.decimal :ov_vacunpc
      t.decimal :ov_vehphh
      t.decimal :ov_vmthday

      t.string  :phase
      t.boolean :mapc
      t.decimal :walkscore

      t.integer :etod_q0car
      t.integer :etod_q25k
      t.integer :etod_qabc
      t.integer :etod_qaff
      t.integer :etod_qdens
      t.integer :etod_qgrav
      t.integer :etod_qrent
      t.integer :etod_qtas
      t.integer :etod_qtci
      t.integer :etod_qwalk
      t.integer :etod_sub1t
      t.integer :etod_sub2o
      t.integer :etod_sub3d
      t.integer :etod_total
      t.string  :etod_type

      t.timestamps
    end
  end
end





