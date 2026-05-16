CREATE TABLE jobs
(
    id           BIGSERIAL PRIMARY KEY,
    external_id  VARCHAR(255), -- Id from source
    source_site  VARCHAR(50),  -- LinkedIn, VietnamWorks, etc.
    title        VARCHAR(500), -- Job title
    company      VARCHAR(500),
    location     VARCHAR(500), -- Hanoi, HoChiMinh, etc.
    salary       VARCHAR(255),
    description  TEXT,         -- Job description
    url          TEXT UNIQUE NOT NULL,
    posted_at    TIMESTAMP,
    first_seen   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_fts_jobs ON jobs USING GIN (to_tsvector('english', title || ' ' || description));