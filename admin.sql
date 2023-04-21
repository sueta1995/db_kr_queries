CREATE USER administrator WITH PASSWORD 'admin12345';

GRANT SELECT, INSERT ON TABLE clients, banned_clients, speech_therapists TO administrator;
GRANT SELECT ON TABLE services, comments, types, contracts TO administrator;
  
