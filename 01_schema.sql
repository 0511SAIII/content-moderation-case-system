CREATE TABLE moderator (
  mod_id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name         VARCHAR2(100) NOT NULL,
  team         VARCHAR2(50),
  status       VARCHAR2(10) DEFAULT 'ACTIVE'
               CHECK (status IN ('ACTIVE','INACTIVE'))
);

CREATE TABLE policies (
  policy_id    NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  category     VARCHAR2(50) NOT NULL,
  severity     NUMBER(1) CHECK (severity BETWEEN 1 AND 5),
  sla_min  NUMBER NOT NULL
);

CREATE TABLE cases (
  case_id      NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  policy_id    NUMBER REFERENCES policies(policy_id),
  mod_id NUMBER REFERENCES moderator(mod_id),
  status       VARCHAR2(15) DEFAULT 'OPEN'
               CHECK (status IN ('OPEN','ASSIGNED','RESOLVED','ESCALATED')),
  created_at   TIMESTAMP DEFAULT SYSTIMESTAMP,
  assigned_at  TIMESTAMP,
  resolved_at  TIMESTAMP
);

CREATE TABLE decisions (
  decision_id  NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  case_id      NUMBER NOT NULL REFERENCES cases(case_id),
  outcome      VARCHAR2(20) CHECK (outcome IN ('VIOLATING','NON_VIOLATING','ESCALATE')),
  notes        VARCHAR2(500),
  decided_at   TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE TABLE audit_log (
  log_id       NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  table_name   VARCHAR2(30),
  action       VARCHAR2(10),
  record_id    NUMBER,
  changed_at   TIMESTAMP DEFAULT SYSTIMESTAMP
);

CREATE INDEX idx_cases_status ON cases(status);
CREATE INDEX idx_cases_mod ON cases(mode_id);