-- Returns enrolled 25D25N users who have made no progress in the last 3 days
-- and have not completed the course.
-- Run in Supabase SQL editor.

CREATE OR REPLACE FUNCTION get_inactive_25d25n_users()
RETURNS TABLE(user_id uuid, email text)
LANGUAGE sql
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT DISTINCT e.user_id, u.email::text
  FROM enrollments e
  JOIN auth.users u ON u.id = e.user_id
  JOIN courses c ON c.id = e.course_id
  WHERE c.slug = '25-days-and-25-nights'
    AND e.completed_at IS NULL
    AND e.created_at < NOW() - INTERVAL '1 day'
    AND NOT EXISTS (
      SELECT 1 FROM progress p
      WHERE p.user_id = e.user_id
        AND p.updated_at > NOW() - INTERVAL '3 days'
    );
$$;
