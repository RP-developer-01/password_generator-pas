program password_generator;

uses crt;

const
  lowercase = 'abcdefghijklmnopqrstuvwxyz';
  uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  digits = '0123456789';
  special_chars = '!@#$%^&*()_+-=[]{};:,./<>?';

var
  password: string;
  password_length: integer;
  complexity_level: integer;
  allowed_chars: string;
  i: integer;
  ch: char;

begin
  randomize;

  repeat
    clrscr; // clear the screen
    writeln('Password Generator');
    writeln('------------------');

    write('Enter password length: ');
    readln(password_length);

    write('Enter complexity level (1-4): ');
    readln(complexity_level);

    allowed_chars := '';

    case complexity_level of
      1: allowed_chars := lowercase;
      2: allowed_chars := lowercase + uppercase;
      3: allowed_chars := lowercase + uppercase + digits;
      4: allowed_chars := lowercase + uppercase + digits + special_chars;
    end;

    password := '';

    for i := 1 to password_length do
      password := password + allowed_chars[random(length(allowed_chars)) + 1];

    writeln('Generated password: ', password);

    writeln('Press R to generate a new password or any other key to exit.');

    ch := readkey;
  until ch <> 'r';

end.
