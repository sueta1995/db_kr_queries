CREATE USER speech_therapist WITH PASSWORD 'therapist12345';

GRANT SELECT ON TABLE clients, children, speech_therapists, services, comments, types TO speech_therapist;
