# synergize
<h1> Synergize: a function in R and Python to unite similarities</h1>
<br>
<p> Basically, this is personal project made when I had to explore giant list of genes and related biological processes across experiments. The main question was "I have many experimental <b>groups</b>. Each group have different <b>elements</b>, and each element have different <b>characteristics</b>. How do I get which elements are common to each pair of groups and sum up their characteristics?"</p>
<br>
<h2>Example</h2>
<table>
  <tr>
    <th>Group1_Resources</th>
    <th>Group1_Components_made_from_resources</th>
    <th>Group2_Resources</th>
    <th>Group2_Components_made_from_resources</th>
  </tr>
  <tr>
    <td>clay</td>
    <td>pot,jar,tile</td>
    <td>rock</td>
    <td>limestone,chalk,marble</td>
  </tr>
  <tr>
    <td>petroleum</td>
    <td>plastic,fuel,asphalt,sweetner</td>
    <td>sand</td>
    <td>chips,glass</td>
  </tr>
  <tr>
    <td>rock</td>
    <td>marble,iron,copper</td>
    <td>petroleum</td>
    <td>fuel,fungicide</td>
  </tr>
 </table>
<br>
<p>Using this example as template, synergize compares both "Resources" rows, then "Components_made_from_resources" and returns which are similar and how many "Components_made_from_resources" are common.</p>
<table>
 <tr>
    <th>Elements</th>
    <th>Characteristics</th>
    <th>Total</th>
  </tr>
  <tr>
    <td>rock</td>
    <td>limestone,chalk,marble,iron,copper</td>
    <td>5</td>
  </tr>
  <tr>
    <td>petroleum</td>
    <td>plastic,fuel,asphalt,sweetner,fungicide</td>
    <td>5</td>
  </tr>
</table>
<p>The function accept a dataframe as input. The arguments el1 and el2 are the <i>elements</i> of each group, char1 and char2 are their <u>characteristics</u>, and name1, name2, name3 are the names for each column in the final table (default is 'Element', 'Characteristics' and 'Total', respectively).
<br>
  <h3>Note</h3>
  <p>The data frame values must be padronized. Be very cautious about typos, letter case and avoid whitespaces.</p>
  <p>Python version does not accept "nan" values in characteristics column
