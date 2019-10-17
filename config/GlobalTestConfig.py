import robot,os

path1=os.environ['FOUNDATIONHOME']
print path1

robot.run(path1+'TestSuite',outputdir=path1+'Report')