-- aa
-- bb
-- cc
-- dd
--XXHR_BIPUB_REP_PKG.pkb comment updated on 1/11/2019 4:15 PM
CREATE OR REPLACE PACKAGE BODY APPS.xxhr_bipub_rep_pkg IS

  PROCEDURE generate_xml( p_errbuf  OUT VARCHAR2
                        , p_retcode OUT NUMBER) IS
  BEGIN
      FND_FILE.put_line(fnd_file.output, '<?xml version="1.0" encoding="UTF-8"?>');
      FND_FILE.put_line(fnd_file.output, '<Roster>');
      FND_FILE.put_line(fnd_file.output, ' <Week>');
      FND_FILE.put_line(fnd_file.output, '  <WeekNo>1</WeekNo>');
      FND_FILE.put_line(fnd_file.output, '  <Monday>Thomas</Monday>');
      FND_FILE.put_line(fnd_file.output, '  <Tuesday>Emily</Tuesday>');
      FND_FILE.put_line(fnd_file.output, '  <Wednesday>Annie</Wednesday>');
      FND_FILE.put_line(fnd_file.output, '  <Thursday>James</Thursday>');
      
      FND_FILE.put_line(fnd_file.output, '  <Friday>Gordon</Friday>');
      FND_FILE.put_line(fnd_file.output, '  <Saturday>Rosie</Saturday>');
      FND_FILE.put_line(fnd_file.output, '  <Sunday>Henry</Sunday>');
      FND_FILE.put_line(fnd_file.output, ' </Week>');
      FND_FILE.put_line(fnd_file.output, ' <Week>');
      FND_FILE.put_line(fnd_file.output, '  <WeekNo>2</WeekNo>');
      FND_FILE.put_line(fnd_file.output, '  <Monday>Bertie</Monday>');
      FND_FILE.put_line(fnd_file.output, '  <Tuesday>Harold</Tuesday>');
      FND_FILE.put_line(fnd_file.output, '  <Wednesday>Toby</Wednesday>');
      FND_FILE.put_line(fnd_file.output, '  <Thursday>Clarabel</Thursday>');
      FND_FILE.put_line(fnd_file.output, '  <Friday>Percy</Friday>');
      FND_FILE.put_line(fnd_file.output, '  <Saturday>Edward</Saturday>');
      FND_FILE.put_line(fnd_file.output, '  <Sunday>Trevor</Sunday>');
      FND_FILE.put_line(fnd_file.output, ' </Week>');
      FND_FILE.put_line(fnd_file.output, '</Roster>');
  end generate_xml;
END xxhr_bipub_rep_pkg;
/
