CREATE USER speech_therapist WITH PASSWORD 'therapist12345';

GRANT SELECT ON TABLE clients, speech_therapists, services, comments, rates TO speech_therapist;
