=
class GeolocationController < ApplicationController

  def sqlQuery()
    sql = "select b.building_administrator_full_name as nomadmin, 
                b.building_technical_contact_full_name as nomtech, 
                CONCAT(ad.street_number,' ',ad.street_name ,' ', ad.city ,' ',ad.postal_code,' ', ad.country )  as addresse,
                ad.latitude latitude,
                ad.longitude longitude,
                bitem.nbbat,
                bitem.nbcol,
                bitem.nbelev
        from buildings b
        join addresses ad on ad.entity_id = b.customer_id
        join (
            select batitemcount.building_id, 
                count(batitemcount.bat_id) nbbat, 
                sum(batitemcount.nbcol) nbcol,
                sum(batitemcount.nbelev) nbelev
            from (
                SELECT bat.id bat_id, bat.building_id , 
                    count(col.id) nbcol,
                    (
                        select count(e.id) nbelev from `columns` c 
                        join elevators e on e.column_id  = c.id
                        where c.battery_id = bat.id
                        GROUP by c.battery_id
                    ) nbelev
                from batteries bat 
                join `columns` col on col.battery_id = bat.id 
                GROUP by bat.id, bat.building_id 
            ) as batitemcount
            GROUP by batitemcount.building_id
        ) as bitem on bitem.building_id = b.id"
    return sql
  end 

  def executeQuery()
    
    results = ActiveRecord::Base.connection.execute(sqlQuery())
  
    if results.present? 
        rep =[]
        # results.each do |row|
        #     h1 = {
        #                 :nomadmin => row['nomadmin'], 
        #                 :nomtech => row['nomtech'], 
        #                 :addresse => row['addresse'], 
        #                 :latitude => row['latitude'], 
        #                 :longitude => row['longitude'], 
        #                 :nbbat => row['nbbat'], 
        #                 :nbcol => row['nbcol'], 
        #                 :nbelev => row['nbelev']
        #             }
        #       rep.push(h1)
        #   end
      return results.as_json
    else
      return nil
    end
  end

  def index
    @hashResults = executeQuery()
    @hashResults.inspect
    @hash = Gmaps4rails.build_markers(@hashResults) do |res, marker|
      # 1 b.building_administrator_full_name as nomadmin, 
      #  2         b.building_technical_contact_full_name as nomtech, 
      #  3         CONCAT(ad.street_number,' ',ad.street_name ,' ', ad.city ,' ',ad.postal_code,' ', ad.country )  as addresse,
      #  4         ad.latitude latitude,
      #   5        ad.longitude longitude,
      #    6       bitem.nbbat,
      #     7      bitem.nbcol,
      #      8     bitem.nbelev
              info = "Administrator name: "+ res[0]+"</br>"+"Client name: "+res[1]
              marker.lat res[3]
              marker.lng res[4]
              # marker.picture {
              #     #"url"=>"http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
              #     "width" 32
              #     "height" 32
              #   }
              # marker.infowindow res.to_s
              #marker.url "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png"
            end

#   end
# end
