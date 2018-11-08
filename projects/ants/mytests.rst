This file holds the tests that you create. Remember to import the python file(s)
you wish to test, along with any other modules you may need.
Run your tests with "python3 ok -t --suite SUITE_NAME --case CASE_NAME -v"
--------------------------------------------------------------------------------

Suite 1

		>>> import ants, importlib
		>>> importlib.reload(ants)

		Case last
			>>> hive = ants.Hive(ants.AssaultPlan())
			>>> dimensions = (2, 9)
			>>> colony = ants.AntColony(None, hive, ants.ant_types(),
			...         ants.dry_layout, dimensions)
			>>> # Extensive damage doubling tests
			>>> queen_tunnel, side_tunnel = [[colony.places['tunnel_{0}_{1}'.format(i, j)]
			...         for j in range(9)] for i in range(2)]
			>>> queen = ants.QueenAnt()
			>>> queen_tunnel[7].add_insect(queen)
			>>> # Turn 0
			>>> thrower = ants.ThrowerAnt()
			>>> fire = ants.FireAnt()
			>>> ninja = ants.NinjaAnt()
			>>> side = ants.ThrowerAnt()
			>>> front = ants.NinjaAnt()
			>>> queen_tunnel[0].add_insect(thrower)
			>>> queen_tunnel[1].add_insect(fire)
			>>> queen_tunnel[2].add_insect(ninja)
			>>> queen_tunnel[8].add_insect(front)
			>>> side_tunnel[0].add_insect(side)
			>>> buffed_ants = [thrower, fire, ninja]
			>>> old_dmgs = [ant.damage for ant in buffed_ants]
			>>> queen.action(colony)
			>>> for ant, dmg in zip(buffed_ants, old_dmgs):
			...     assert ant.damage == dmg * 2,\
			...         "{0}'s damage is {1}, but should be {2}".format(ant, ant.damage, dmg * 2)
			>>> for ant in [side, front]:
			...     assert ant.damage == dmg,\
			...         "{0}'s damage is {1}, but should be {2}".format(ant, ant.damage, dmg)
			>>> assert queen.damage == 1,\
			...     'QueenAnt damage was modified to {0}'.format(ant.damage)
			>>> # Turn 1
			>>> tank = ants.TankAnt()
			>>> guard = ants.BodyguardAnt()
			>>> queen_tank = ants.TankAnt()
			>>> queen_tunnel[6].add_insect(tank)          # Not protecting an ant
			>>> queen_tunnel[1].add_insect(guard)         # Guarding FireAnt
			>>> queen_tunnel[7].add_insect(queen_tank)    # Guarding QueenAnt
			>>> buffed_ants.extend([tank, guard])
			>>> old_dmgs.extend([ant.damage for ant in [tank, guard, queen_tank]])
			>>> queen.action(colony)
			>>> for ant, dmg in zip(buffed_ants, old_dmgs):
			...     assert ant.damage == dmg * 2,\
			...         "{0}'s damage is {1}, but should be {2}".format(ant, ant.damage, dmg * 2)
			>>> # Turn 2
			>>> thrower1 = ants.ThrowerAnt()
			>>> thrower2 = ants.ThrowerAnt()
			>>> queen_tunnel[6].add_insect(thrower1)      # Add thrower1 in TankAnt
			>>> queen_tunnel[5].add_insect(thrower2)
			>>> buffed_ants.extend([thrower1, thrower2])
			>>> old_dmgs.extend([ant.damage for ant in [thrower1, thrower2]])
			>>> queen.action(colony)
			>>> for ant, dmg in zip(buffed_ants, old_dmgs):
			...     assert ant.damage == dmg * 2,\
			...         "{0}'s damage is {1}, but should be {2}".format(ant, ant.damage, dmg * 2)
			AssertionError: ThrowerAnt(1, tunnel_0_6)'s damage is 1, but should be 2
