<h1>Coursera Getting and Cleaning Data project - Code Book</h1>

<p>Libraries:</p>
<ul>
  <li>plyr</li>
  <li>reshape2</li>
</ul>

<p>Important Notes</p>
<ul>
  <li>Features were read in from features.txt, then transposed for use as col label.s</li>
  <li>Subjects were read in from test and train datasets, then comined with rbind.</li>
  <li>Activities were read in from test and train datasets, combined with rbind, then values replaced with labels.</li>
  <li>Only columns which contained either "mean" or "sd" in the name were kept. Names come from features.txt</li>
  <li>Data was then molten to tidy things up. subjects and activities are the ID vars.</li>
  <li>Data was the cast using dcast to compute means for each subject and activity.</li>
</ul>

<p>variables</p>
<ul>
  <li>subjects: integer describing which subject the data belongs to.</li>
  <li>activities: activity performed by subject.
  <li>Features: Mean for each is computed by subject and std dev, based on the test and training sets. Variable names were cleaned up as follows: t replaced with "Time", f replaced with "Freq", hyphens removed, "mean" changed to "Mean" and "std" changed to "StdDev". 
</ul>
