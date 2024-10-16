SELECT
		 a.`name`,
		 d.`day`,
		 h1.`hour` AS `start`,
		 h2.`hour` AS `finish` 
		 FROM sk_pd_shift_schedules AS s
		 		INNER JOIN sk_pd_shifts AS a ON s.shift_id = a.id
		 		INNER JOIN sk_pd_shift_days AS d ON s.shift_day_id = d.id
		 		INNER JOIN sk_pd_shift_hours AS h1 ON s.shift_hour_id_start = h1.id
		 		INNER JOIN sk_pd_shift_hours AS h2 ON s.shift_hour_id_finish = h2.id
		 		ORDER BY s.shift_id, h1.id