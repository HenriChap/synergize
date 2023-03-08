import pandas as pd

def synergize(data_frame, el1=0, el2=2, char1=1, char2=3, x="Elements", y="Characteristics", z="Total"):
    # selecting elements characteristics inside a pandas.Series
    element1 = data_frame.iloc[:, char1].str.split(',')
    element2 = data_frame.iloc[:, char2].str.split(',')
    # setting elements names and changing to dictionary
    element1 = dict(zip(data_frame.iloc[:, el1], element1))
    element2 = dict(zip(data_frame.iloc[:, el2], element2))
    # removing elements without characteristics, but nan values will cause error
    element1 = {k: v for k, v in element1.items() if len(v) != 1 or v[0] != ''}
    element2 = {k: v for k, v in element2.items() if len(v) != 1 or v[0] != ''}
    # setting a list to store loop result
    result = {}
    # if the element is repeated in both columns, the characteristics will be selected without repetition
    for i in element2:
        for j in element1:
            if i == j:
                output = list(set(element2[i]) | set(element1[j]))
                result[i] = output
    # setting object back to data frame
    result_df = pd.DataFrame(result.items(), columns=[x, y])
    # checking if there is some similar element between columns
    if len(result_df) > 0:
        # uniting characteristisc in a string
        result_df[y] = result_df[y].apply(lambda x: ','.join(list(set(x))))
        # counting characteristics
        result_df[z] = result_df[y].apply(lambda x: len(x.split(',')))
        # naming columns and returning value
        result_df = result_df[[x, y, z]].rename(columns={x: x, y: y, z: z})
        return result_df
    # if there are no similarities
    else:
        print("There are no common elements")
        return None