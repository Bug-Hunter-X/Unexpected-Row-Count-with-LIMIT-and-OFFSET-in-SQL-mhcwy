# SQL LIMIT and OFFSET Unexpected Behavior

This repository demonstrates a common issue with SQL's `LIMIT` and `OFFSET` clauses.  When retrieving paged data, an `OFFSET` exceeding the available rows can result in fewer rows being returned than expected, without an error being reported. This can lead to subtle bugs in applications that rely on consistent page sizes.

The `bug.sql` file contains code that exemplifies this problem.  The `bugSolution.sql` offers a potential improvement.