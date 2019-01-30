create or replace PACKAGE MP2.BL_NUMBER AS 

  PROCEDURE ut_setup;
  PROCEDURE ut_teardown;
  
  FUNCTION validate_is_number(in_value in varchar2) RETURN Boolean;

END BL_NUMBER;
/
create or replace package body MP2.bl_number as
 
   PROCEDURE ut_setup IS
   BEGIN
      NULL;
   END;
   
   PROCEDURE ut_teardown
   IS
   BEGIN
      NULL;
   END;
  
  Function validate_is_number(in_value in varchar2)
  return boolean is
  begin
    if not regexp_like(in_value, '^[[:digit:]]+$') then
      return false;
    end if;
 
    return true;
  end validate_is_number;
 
end bl_number;
/
create or replace PACKAGE MP2.UT_BL_NUMBER AS 

  procedure ut_setup;
  procedure ut_teardown;
 
  procedure ut_validate_is_number;

END UT_BL_NUMBER;
/
create or replace package body MP2.ut_bl_number as
 
  procedure ut_setup as
  begin
    null;
  end ut_setup;
 
  procedure ut_teardown as
  begin
    null;
  end ut_teardown;
 
  procedure ut_validate_is_number as
  begin
    utassert.eq(
      msg_in          => '12345 is a number',
      check_this_in   => bl_number.validate_is_number('112345'),
      against_this_in => true
    );
    utassert.eq(
      msg_in          => 'abcdef is only letters',
      check_this_in   => bl_number.validate_is_number('abcdef'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => '@#$%& is only symbols',
      check_this_in   => bl_number.validate_is_number('@#$%&'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => '3Ab$cde21%@ is a mix of symbols, letters, numbers',
      check_this_in   => bl_number.validate_is_number('3Ab$cde21%@'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => '67890 is a number',
      check_this_in   => bl_number.validate_is_number('67890'),
      against_this_in => true
    );
  end ut_validate_is_number;
 
end ut_bl_number;
/
create or replace PACKAGE MP2.BL_USER_REGISTRATION AS 
  
  FUNCTION validate_password_strength(in_password in varchar2) RETURN Boolean;

END BL_USER_REGISTRATION;
/
create or replace package body MP2.bl_user_registration as
 
  Function validate_password_strength(in_password in varchar2)
  return boolean is
  begin
    if not regexp_like(in_password, '[[:digit:]]') then
      return false;
    end if;
 
    if not regexp_like(in_password, '[[:lower:]]') then
      return false;
    end if;
 
    if not regexp_like(in_password, '[[:upper:]]') then
      return false;
    end if;
 
    if not regexp_like(in_password, '[@#$%]') then
      return false;
    end if;
 
    if length(in_password) is null or length(in_password) not between 6 and 20 then
      return false;
    end if;
 
    return true;
  end validate_password_strength;
 
end bl_user_registration;
/
create or replace package MP2.ut_bl_user_registration as
 
  procedure ut_setup;
  procedure ut_teardown;
 
  procedure ut_validate_password_strength;
 
end ut_bl_user_registration;
/
create or replace package body         MP2.ut_bl_user_registration as
 
  procedure ut_setup as
  begin
    null;
  end ut_setup;
 
  procedure ut_teardown as
  begin
    null;
  end ut_teardown;
 
  procedure ut_validate_password_strength as
  begin
    utassert.eq(
      msg_in          => 'ABCdef123# is a strong password',
      check_this_in   => bl_user_registration.validate_password_strength('ABCdef123#'),
      against_this_in => true
    );
    utassert.eq(
      msg_in          => '%a1B2CD is a strong password',
      check_this_in   => bl_user_registration.validate_password_strength('%a1B2CD'),
      against_this_in => true
    );
    utassert.eq(
      msg_in          => 'Abcde1@ is a strong password',
      check_this_in   => bl_user_registration.validate_password_strength('Abcde1@'),
      against_this_in => true
    );
 
    utassert.eq(
      msg_in          => 'Abcdef# misses a digit character',
      check_this_in   => bl_user_registration.validate_password_strength('Abcdef#'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => 'ABCD1234$ misses a lowercase character',
      check_this_in   => bl_user_registration.validate_password_strength('ABCD1234$'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => 'abcd1234@ misses an uppercase character',
      check_this_in   => bl_user_registration.validate_password_strength('abcd1234@'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => 'ABcd1234 misses a special character',
      check_this_in   => bl_user_registration.validate_password_strength('ABcd1234'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => 'Abc1% is too short',
      check_this_in   => bl_user_registration.validate_password_strength('Abc1%'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => 'Abcdefghijk123456789@ is too long',
      check_this_in   => bl_user_registration.validate_password_strength('Abcdefghijk123456789@'),
      against_this_in => false
    );
    utassert.eq(
      msg_in          => 'An empty string should return false',
      check_this_in   => bl_user_registration.validate_password_strength(''),
      against_this_in => true
    );
  end ut_validate_password_strength;
 
end ut_bl_user_registration;
/
grant execute on MP2.UT_BL_USER_REGISTRATION to UTP;
/
grant execute on MP2.BL_NUMBER to UTP;
/
grant execute on MP2.UT_BL_NUMBER to UTP;
/