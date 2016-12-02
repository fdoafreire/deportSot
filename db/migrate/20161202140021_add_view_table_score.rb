class AddViewTableScore < ActiveRecord::Migration[5.0]
  def up
    sql = <<-SQL

		create view table_score as 
		     select 
		        t.championship_id as championship_id,
		        t.id as "id",
		        t.name as "Name",
		        getMatchesWon(t.id) as "PG",
		        getMatchesTied(t.id) as "PE",
		        getMatchesLost(t.id) as "PP",
		        getGolesAFavor(t.id) as "GF",
		        getGolesEnContra(t.id) as "GC",
		        getGolesDiferencia(t.id) as "GD",
		        (getMatchesWon(t.id) * 3 + getMatchesTied(t.id))as "Puntos"
		     from teams t;    
    SQL
    execute sql
  end  	
  def down
    execute "DROP view table_score"
  end
end
