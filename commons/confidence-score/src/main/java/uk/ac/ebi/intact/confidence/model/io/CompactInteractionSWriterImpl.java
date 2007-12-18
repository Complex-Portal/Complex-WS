/**
 * Copyright 2007 The European Bioinformatics Institute, and others.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 *  limitations under the License.
 */
package uk.ac.ebi.intact.confidence.model.io;

import uk.ac.ebi.intact.confidence.model.InteractionSimplified;
import uk.ac.ebi.intact.confidence.model.ProteinSimplified;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.Collection;
import java.util.Iterator;

/**
 * Writes an InteractionSimplified as
 * <uniprotAc>;<uniprotAc>
 *
 * @author Irina Armean (iarmean@ebi.ac.uk)
 * @version $Id$
 * @since TODO specify the maven artifact version
 *        <pre>
 *        13-Dec-2007
 *        </pre>
 */
public class CompactInteractionSWriterImpl implements InteractionSimplifiedWriter {

    public void append( InteractionSimplified interactionSimplified, File outFile ) throws IOException {
        if (interactionSimplified.getComponents().size() != 2){
            throw new IllegalArgumentException( "InteractionSimplified must have 2 and only 2 components!");
        }
        // writes BinaryInteractions
        Writer writer = new FileWriter(outFile, true);
        String binaryIntLine = binaryLine(interactionSimplified);
        writer.append( binaryIntLine + "\n");
        writer.close();
    }

    public void append( Collection<InteractionSimplified> interactions, File outFile ) throws IOException {
        Writer writer = new FileWriter(outFile, true);
        for ( Iterator<InteractionSimplified> iterator = interactions.iterator(); iterator.hasNext(); ) {
            InteractionSimplified interactionSimplified = iterator.next();
             writer.append( binaryLine(interactionSimplified) +"\n");
        }
        writer.close();
    }

    public void write( Collection<InteractionSimplified> interactions, File outFile ) throws IOException {
        if (outFile.exists()){
            outFile.delete();
        }
        Writer writer= new FileWriter(outFile);
       for ( Iterator<InteractionSimplified> iterator = interactions.iterator(); iterator.hasNext(); ) {
           InteractionSimplified interaction = iterator.next();
           writer.append(binaryLine( interaction) + "\n");
       }
    }

      private String binaryLine( InteractionSimplified interactionSimplified ) {
          Iterator<ProteinSimplified> iter = interactionSimplified.getComponents().iterator();
          String result = iter.next().getUniprotAc().getAcNr();
          while ( iter.hasNext() ) {
              result += ";" + iter.next().getUniprotAc().getAcNr();
          }
          return result;
    }
}
