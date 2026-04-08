-- Fix test_results table schema
-- Add missing columns for patient data tracking

ALTER TABLE test_results 
ADD COLUMN IF NOT EXISTS patient_name TEXT;

ALTER TABLE test_results 
ADD COLUMN IF NOT EXISTS submitted_at TIMESTAMP;

-- Verify the columns were added
SELECT column_name, data_type 
FROM information_schema.columns 
WHERE table_name = 'test_results' 
ORDER BY ordinal_position;
