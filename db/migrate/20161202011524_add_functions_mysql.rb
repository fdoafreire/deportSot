class AddFunctionsMysql < ActiveRecord::Migration[5.0]
  def up
    sql = <<-SQL
      CREATE FUNCTION getMatchesWon(team INT) RETURNS INT
      BEGIN
        DECLARE mwlocal INT;
        DECLARE mwvisitant INT;
        DECLARE mwtotal INT;
	    SET mwlocal=(SELECT count(*) FROM matches WHERE local_id = team and goals_local_team > goals_visitant_team);        
	    SET mwvisitant=(SELECT count(*) FROM matches WHERE visitant_id = team and goals_visitant_team > goals_local_team);        
	    SET mwtotal = (mwlocal + mwvisitant);
	    RETURN mwtotal;
      END
    SQL
    execute sql

    sql = <<-SQL
      CREATE FUNCTION getMatchesTied(team INT) RETURNS INT
      BEGIN
        DECLARE mwlocal INT;
	    SET mwlocal=(SELECT count(*) FROM matches WHERE (local_id = team or visitant_id = team) and goals_local_team = goals_visitant_team);        
	    RETURN mwlocal;
      END
    SQL
    execute sql

    sql = <<-SQL
      CREATE FUNCTION getMatchesLost(team INT) RETURNS INT
      BEGIN
        DECLARE mwlocal INT;
        DECLARE mwvisitant INT;
        DECLARE mwtotal INT;
	    SET mwlocal=(SELECT count(*) FROM matches WHERE local_id = team and goals_local_team < goals_visitant_team);        
	    SET mwvisitant=(SELECT count(*) FROM matches WHERE visitant_id = team and goals_visitant_team < goals_local_team);        
	    SET mwtotal = (mwlocal + mwvisitant);
	    RETURN mwtotal;
      END
    SQL
    execute sql

  end
  def down
    execute "DROP FUNCTION getMatchesWon"
    execute "DROP FUNCTION getMatchesTied"
    execute "DROP FUNCTION getMatchesLost"
  end
end
