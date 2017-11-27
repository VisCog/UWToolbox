## UW Toolbox 

This is a work in progress, more functions / folders will be added as they have been tested and are functional.

Kelly is currently in charge of organizing this toolbox, so email her if you have questions!

---

# tutorials

Collection HTML rendered tutorials for various implementations of toolbox scripts.

[optimization](http://htmlpreview.github.io/?https://github.com/VisCog/UWToolbox/blob/master/tutorials/optimization/FitDemo.html)

---

# optimization

fit.m - Helpful interface to MATLAB's 'fminsearch' function. Performs a non-linear minimization algorithm.

fitcon.m - Helpful interface to MATLAB's 'fmincon' function. Performs a non-linear minimization algorithm within specified constrained boundaries. If problem does not require constraints, use fit.m for efficiency.

Support Function / Dependencies:
- fitFunction.m, params2var.m, params2varcon.m, var2params.m, str2vec.m

FitDemo.m - raw fit/fitcon tutorial script
- Dependencies: rosenbrock.n

---

# Contributors

Creator: Geoffrey Boynton - @gboynton - gboynton@uw.edu

Ione Fine - @ionefine - ionefine@uw.edu

Kelly Chang - @kellychang4 - kchang4@uw.edu