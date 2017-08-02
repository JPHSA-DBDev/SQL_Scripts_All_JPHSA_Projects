SELECT 
	zzzA.LK_ID, 
	zzzB.LIST_Quetions_PK, 
	zzzB.Form, 
	zzzB.Order
FROM 
		zzzA 
		RIGHT OUTER JOIN 
		zzzB 
ON (zzzA.FL_Order = zzzB.Order) AND (zzzA.FL_Form = zzzB.Form);



SELECT LIST_Lookups.Value, LIST_Lookups.ValueLabel, LIST_Lookups.LK_ID
FROM LIST_Lookups
WHERE LIST_Lookups.LK_ID = 1
ORDER BY LIST_Lookups.[ValueLabel];


SELECT 
		MAP_Q_PK_2_Lookup_ID.LK_ID
FROM MAP_Q_PK_2_Lookup_ID
WHERE MAP_Q_PK_2_Lookup_ID.LIST_Quetions_PK =9
;


SELECT LIST_Lookups.Value, LIST_Lookups.ValueLabel, LIST_Lookups.LK_ID
FROM LIST_Lookups
WHERE (
		(LIST_Lookups.LK_ID IN (
								SELECT 
								MAP_Q_PK_2_Lookup_ID.LK_ID
								FROM MAP_Q_PK_2_Lookup_ID
								WHERE MAP_Q_PK_2_Lookup_ID.LIST_Quetions_PK =9
								)
		)
	  )
ORDER BY LIST_Lookups.[ValueLabel];



SELECT LIST_Lookups_BAD.LK_ID, LIST_Lookups_BAD.Value, LIST_Lookups_BAD.ValueLabel
FROM LIST_Lookups_BAD;


SELECT
	LIST_Lookups_BAD.LK_ID, 
	LIST_Lookups_BAD.Value, 
	LIST_Lookups_BAD.ValueLabel, 

FROM LIST_Lookups_BAD
WHERE ((Mid([LIST_Lookups_BAD]![Value],1,1)="7"));


SELECT
    LIST_Lookups_BAD.LK_ID, 
	Switch(
        [LIST_Lookups_BAD]![LK_ID]<>3, LIST_Lookups_BAD.LK_ID,
		( (Mid([LIST_Lookups_BAD]![Value],1,1)="7") AND ([LIST_Lookups_BAD]![LK_ID] = 3)), LIST_Lookups_BAD.LK_ID,
		([LIST_Lookups_BAD]![LK_ID] = 3), 37

        ) AS LK_ID_NEW, 
	LIST_Lookups_BAD.Value, 
	LIST_Lookups_BAD.ValueLabel

FROM LIST_Lookups_BAD;

