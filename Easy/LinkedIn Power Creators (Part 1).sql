SELECT p.profile_id
FROM personal_profiles p
LEFT JOIN company_pages c
ON p.employer_id = c.company_id
WHERE p.followers > c.followers
ORDER BY p.profile_id asc;
