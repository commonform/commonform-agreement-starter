Starting point for a traditionally structured contract, written in plain-text Common Form markup and rendered to Microsoft Word .docx with command-line tools.

With Git, Node.js, and npm installed:

```shellsession
$ git clone https://github.com/commonform/commonform-agreement-starter agreement
$ cd agreement
$ make # Builds agreement.docx.
$ make html # Builds agreement.docx.
$ make markdown # Builds agreement.docx.
$ make lint # Checks for structural issues.
$ make critique # Mocks archaic and problematic word choices.
```

With Unoconv installed:

```shellsession
$ make pdf # Builds agreement.pdf.
```
