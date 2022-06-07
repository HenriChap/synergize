# synergize
<h1> Synergize: a function in R to unite similarities</h1>
<br>
<p> Basically, this is personal project made when I had to explore giant list of genes and related biological processes. The main question was "I have many experimental <b>groups</b>, each group have different <u>elements</u>, and each element have different <i>characteristics</i>. How do I get which elements are common to each pair of groups and sum up their characteristics?"</p>
<br>
<h2>Example</h2>
<table>
  <tr>
    <td><b>Group1_Resources</b></td>
    <td><b>Group1_Components_made_from_resources</b></td>
    <td><b>Group2_Resources</b></td>
    <td><b>Group2_Components_made_from_resources</b></td>
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
    <td><b>Elements</b></td>
    <td><b>Characteristics</b></td>
    <td><b>Total</b></td>
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
  <p>The dataframe must be padronized. Be very cautious about typos, letter case and avoid whitespaces.</p>
